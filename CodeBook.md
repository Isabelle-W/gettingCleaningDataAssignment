# CodeBook for course project 
Human Activity Recognition Using Smartphones Dataset
======================================
Reference:Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 201

Experimental design
======================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


The raw data consists of
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration (Acc).
- Triaxial Angular velocity from the gyroscope (Gyro). 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The dataset can be downloaded using script download_data.R and includes the following files:
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Processing the data using script run_analysis.R
======================================
This script merges the training and test datasets, extracts only the variables representing mean and standard deviation (std), labels the columns with descriptive variable names and creates a tidy dataset with variable averages for each subject and activity. The processed data will finally be written into file tidy_dataset.txt. 

Description of the variable names in tidy dataset:
======================================

- subjectID: identifier of subject 1..30
- activity: measured activity for each subject WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
- variable: one of 66 variables representing 3-axial (-XYZ) averages of the following mean and std features where 't' stands for time, 'f ' for frequency, 'Acc' for acceleration, 'Gyro' for gyroscope and 'Mag' for magnitude:
	- tBodyAcc
	- tGravityAcc
	- tBodyAccJerk
	- tBodyGyro
	- tBodyGyroJerk
	- tBodyAccMag
	- tGravityAccMag
	- tBodyAccJerkMag
	- tBodyGyroMag
	- tBodyGyroJerkMag
	- fBodyAcc
	- fBodyAccJerk
	- fBodyGyro
	- fBodyAccMag
	- fBodyAccJerkMag
	- fBodyGyroMag
	- fBodyGyroJerkMag
- average: average of the variable value per subjectID and activity

