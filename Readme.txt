
========================================================================
==============================INTRODUCTION==============================
========================================================================


This file describes the nature of th experiment that was conducted. See Footnote [1]
Also the original data sets provided for the purpose of this course project and how they are used for the project. Also, what the "run_analysis.R" is scripted to perform.


In this project, the following files are included:

- 'CodeBook.txt'

- run_analysis.R
The R Script file that will combine the various original data sets and assign meaningful variable names to the data (Course Project Step 1 to 4 Requirements;
 also to create an output txt file which contains the independent tidy data set with the average of each variable that is a mean or standard deviation measurement for each activity and each subject. (Course Project Step 5 Requirements)

- 'features_info.txt': Original data file. See Footnote [1]
Shows information about the variables used on the feature vector.


========================================================================
========================== ABOUT THE EXPERIMENT ========================
========================================================================


==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


========================================================================
====================== ORIGINAL DATA SETS PROVIDED =====================
========================================================================

This section describes the original data sets provided in the course requirements.

It consist of two sets of data - train and test. They are stored in the train and test folder respectively. These 2 datasets are made up of 70% of the volunteers from the experiment for generating the training data and 30% the test data. 

Note:
In order to have a complete data set conducted for this experiement, these two sets of data (train and test) needs to be merged.



The following is a description of data files provided:
======================================

- 'features.txt': 
Contains 2 variables that list of all 561 features with time and frequency domain. 
Variable 1 is an Index number.
Variable 2 is the list of 561 measurements. The description of each measurements and how they are derived can be found in 'feature_info.txt'

The features are normalized and bounded within [-1,1].
Each feature vector is a row on the text file.

Naming convention of the measurements as follows:
- prefix 't' is to denote time. time domain signals were captured at a constant rate of 50 Hz
- prefix 'f' to indicate frequency domain signals. 
- XYZ is used to denote 3-axial signals in the X, Y and Z directions.


- 'activity_labels.txt': Contains 2 variables that list all the 6 types of activities.
Variable 1 is an index number. It is ranged from 1 to 6.
Varaible 2 is the activity name: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
Example, 1 is for WALKING, 2 is for WALKING_UPSTAIRS, etc


The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/x_train.txt': Contains the Training data set
Both contains the 561 variables/measurements, without column headers/variable names.'

- 'train/y_train.txt': Contains the activity index number for each of the record found in Train/X_Train.txt
It is ranged from 1 to 6.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample in 'y_train.txt'. It is ranged from 1 to 30. 


- 'train/Inertia Signal/total_acc_x_train.txt'.
The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
The data is not required in this Course Project

- 'train/Inertial Signals/body_acc_x_train.txt': 
The body acceleration signal obtained by subtracting the gravity from the total acceleration.
The data is not required in this Course Project

- 'train/Inertial Signals/body_gyro_x_train.txt':
The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
The data is not required in this Course Project


========================================================================
=========================== run_analysis.R============================== 
========================================================================

This section describes the values, data frames, output files created via running the run_analysis.R script.
It also provides an overview of the steps/codes written in the R script file. Comments are also available in the R Script itself.

================================= Values================================ 

originalURL: contains the URL to download the data sets required for this project.
In this case as provided in the Project requirements: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


destnURL: contains the filename of the downloaded data in the working directory.
In this case: ""ProjectOriginalFile.zip"


================== Data Frames Created ==================================
activity_DF: Stores the data from 'activity_labels.txt'
features_DF: Stores the data from 'features.txt'

Subject_Test_DF: Stores the data from 'test/subject_train.txt'
Subject_Train_DF: Stores the data from 'train/subject_train.txt'
Subject_DF: Combines the data from the previous 2 data frames to get the full records of Subject for the window recorded.


X_Test_DF: Stores the data from 'test/x_test.txt'
X_Train_DF: Stores the data from 'train/x_train.txt'
X_DF: Combines the data from the previous 2 data frames to get the full records of data set conducted in the experiment

Y_Test_DF: Stores the data from 'test/y_test.txt'
Y_Train_DF: Stores the data from 'train/y_train.txt'
Y_DF: Combines the data from the previous 2 data frames to get the full records of data set conducted in the experiment


MainDF: The data frame that contains the merged data from the Subject_DF, X_DF, Y_DF data frame.

Mean_Std_DF: A subset of the data fom MainDF. The data frame that contains SubjectID, Activity, and the measurements on the mean and standard deviation for each measurement. If the variable name contains the words "mean" or "std", then it will be considered as a mean or standard deviation of a measurement.

Avg_BySubjectActivity: A data frame that contains the mean of each variable stored in the Mean_Std_DF data frame, and grouped by SubjectID and Activity. I.e. Each combination of Subject ID and Activity is a unique record in this data frame.


================== Output files Created ==================================
This script will produce a output txt file named "Point5_AverageOfMeasurements.txt" in the working directory.
It is the data stored in "Avg_BySubjectActivity" data frame.


========= How run_analysis.R works (Overview of Steps/Codes) ============== 

1) Download the necessary files required from the source provided and unzips it in the working directory.

2) References the necessary libraries required

3) Read the downloaded files into various dataframes described above in the "Data Frame Created" section. E..g X_Test_DF, X_Train_DF, etc. 

4) Combine both Test and Train data sets together as one data frame for the equivalent data. E.g. X_DF, etc

5) Assign meaningful variable/column names for each of the data sets
	- For X_DF, the names are already stored in feature_DF. Therefore assigning for each column with the corresponding rows in feature_DF
	- For Y_DF, it is manually named with "ActivityID"
	- For Subject_DF, it is manually named with "SubjectID"

6) Combine/Merge the various data sets (Subject_DF, X_DF, Y_DF) into one main data frame, ie MainDF

7) Add the activity name for each of the recod in Main_DF via the "join" function

8) Subsetting the MainDF into a new data frame call "Mean_Std_DF" using the grep() function. The grep function in this case will match against the column names in MainDF. If the variable name contains the words "mean" or "std, it will be stored in  "Mean_Std_DF". This is to pick out values that of mean and standard deviation for each measurement.

9) Aadd the SubjectID and Activity for records in "Mean_Std_DF" 


10) Aggregate the mean of each variable/column stored in "Mean_Std_DF" by by SubjectID and Activity and stored in a new data frame named "Avg_BySubjectActivity" without row names.

11) Export the final results from "Avg_BySubjectActivity" data frame into a file named"Point5_AverageOfMeasurements.txt" in the working directory.





========================================================================
==================== Foot Notes and References ========================= ========================================================================

License:
========
Use of the original dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


For more information
========

[2] For more information about the original dataset contact: activityrecognition@smartlab.ws