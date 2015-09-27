# GetCleanDataProject
This section provides an overview of the steps/codes written in the R script file. Comments are also available in the R Script itself.


###Output files Created
This script will produce a output txt file named "Point5_AverageOfMeasurements.txt" in the working directory. It is the data stored in "Avg_BySubjectActivity" data frame.


###How run_analysis.R works (Overview of Steps/Codes) 

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

