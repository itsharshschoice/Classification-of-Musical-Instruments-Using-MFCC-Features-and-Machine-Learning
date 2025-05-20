clc; clear; close all;

audioFiles = {
    'D:\Song\drum.wav'
    'D:\Song\guitar.wav'
    'D:\Song\violin.wav'
    'D:\Song\saxophone.wav'
    'D:\Song\flute.wav'
};

mfccFeatures = [];
labels = [];
targetFs = 16000;

disp('Extracting features from training data...');
for i = 1:length(audioFiles)
    filePath = audioFiles{i};
    [audio, fs] = audioread(filePath);
    if fs ~= targetFs
        audio = resample(audio, targetFs, fs);
        fs = targetFs;
    end
    audio = audio / max(abs(audio));
    mfccData = mfcc(audio, fs, 'NumCoeffs', 13);
    mfccFeatures = [mfccFeatures; mfccData];
    labels = [labels; repmat(i, size(mfccData, 1), 1)];
end

disp('Training classifier...');
svmModel = fitcecoc(mfccFeatures, labels);

disp('Processing new audio file...');
newFilePath = 'D:\Song\flute1.wav';
[newAudio, fs] = audioread(newFilePath);
if fs ~= targetFs
    newAudio = resample(newAudio, targetFs, fs);
    fs = targetFs;
end
newAudio = newAudio / max(abs(newAudio));
newMFCC = mfcc(newAudio, fs, 'NumCoeffs', 13);

disp('Predicting instrument class...');
predicted_labels = predict(svmModel, newMFCC);
predicted_label = mode(predicted_labels);
instrumentNames = {'Drum', 'Guitar', 'Violin', 'Saxophone', 'Flute'};
fprintf('Instrument Detected: %s\n', instrumentNames{predicted_label});

disp('Evaluating model...');
c = cvpartition(labels, 'Holdout', 0.2);
trainFeatures = mfccFeatures(training(c), :);
testFeatures = mfccFeatures(test(c), :);
trainLabels = labels(training(c));
testLabels = labels(test(c));

svmModelCV = fitcecoc(trainFeatures, trainLabels);
predicted_test_labels = predict(svmModelCV, testFeatures);

accuracy = sum(predicted_test_labels == testLabels) / numel(testLabels);
fprintf('Model Accuracy: %.2f%%\n', accuracy * 100);

