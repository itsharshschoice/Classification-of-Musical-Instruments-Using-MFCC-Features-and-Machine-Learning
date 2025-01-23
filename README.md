
# **Classification of Musical Instruments Using MFCC Features and Machine Learning**

## **Overview**
This project implements a system to classify musical instruments based on their audio recordings. It uses **MFCC (Mel-Frequency Cepstral Coefficients)** for feature extraction and a **Support Vector Machine (SVM)** classifier for accurate predictions. The system currently supports identification of the following instruments:
- **Drum**
- **Guitar**
- **Violin**
- **Saxophone**
- **Flute**

The system is designed for audio signal analysis, leveraging machine learning techniques to predict the type of instrument from an unknown audio file.



## **Features**
- **Feature Extraction**: Uses MFCC to extract meaningful features from audio signals.
- **Standardized Sampling**: Resamples all input audio to a consistent frequency of 16 kHz for uniform processing.
- **Machine Learning Model**: Employs SVM with Error-Correcting Output Codes (ECOC) for robust classification.


## **Technologies Used**
- **MATLAB**: For signal processing, feature extraction, and classifier training.
- **MFCC**: Feature extraction technique for audio analysis.
- **Support Vector Machine (SVM)**: Supervised learning model for classification.
- **Audio Signal Processing**: Includes preprocessing steps such as normalization and resampling.


## **Setup Instructions**

1. **Clone the Repository**  
   Clone this repository to your local machine:
   ```bash
   git clone https://github.com/itsharshschoice/Classification-of-Musical-Instruments-Using-MFCC-Features-and-Machine-Learning.git
   cd Classification-MFCC
   ```

2. **Prepare Training and Test Data**  
   - Place the training audio files (e.g., `drum.wav`, `guitar.wav`) in the `audio_files/` directory.
   - Add any new test audio files to the `test_audio/` folder.

3. **Update the File Paths**  
   Open the MATLAB script `Music_Instrument_Detector.mlx` and update the `audioFiles` and `newFilePath` variables with the correct file paths.

4. **Run the MATLAB Script**  
   Open MATLAB and execute the script:
   ```matlab
   Music_Instrument_Detector
   ```

---

## **Usage**

### **Training the Model**
- The script reads audio files from the `audio_files` folder.
- MFCC features are extracted, and an SVM model is trained on these features.

### **Classifying New Audio**
- Place the audio file you want to classify in the `test_audio/` folder.
- Update the `newFilePath` variable with the file's path.
- Run the script to predict the instrument class.


## **Sample Output**
### **Prediction Example**
```
Extracting features from training data...
Training classifier...
Processing new audio file...
Predicting instrument class...
Instrument Detected: Flute
```

### **Accuracy Example**
```
Evaluating model...
Model Accuracy: 94.50%
```

---

## **Limitations**
1. **Insufficient Training Data**:  
   The model's accuracy may suffer if the training dataset is small or lacks diversity. Instruments with subtle tonal differences are particularly prone to misclassification. Sometimes model may give incorrect results also due to small training dataset.

2. **Generalization Issues**:  
   The model might fail to generalize well to audio recorded in different environments, with varying quality or noise levels.

## **Conclusion**

This project shows how machine learning and audio processing can be used to identify musical instruments from their sound. By using MFCC features and a Support Vector Machine (SVM) classifier, the system can predict which instrument is playing in an audio recording. Although the model works well with the current dataset, it can be improved by using more data from different sources. This project can be expanded to recognize more instruments and explore better methods for higher accuracy.


