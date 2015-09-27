#========Introduction=================================================
#This script is written for the Getting and Cleaning Data Course Project.
#The output for this script is to produce a file named "Point5_AverageOfMeasurements.txt"
#which stores the data from Avg_BySubjectActivity data frame in the working directory

#Avg_BySubjectActivity contains the independent tidy data set 
#with the average of each variable that is a mean or standard deviation 
#measurement for each activity and each subject. 

#==================Download the necessary files=======================

originalURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destnURL <- "ProjectOriginalFile.zip"
download.file(originalURL, destfile = "ProjectOriginalFile.zip")
unzip(destnURL)

#=======================Load the libraries required=================
library(plyr)



#======Read/Load master reference data and assign meaningful column names=======

activity_DF <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_DF) <- c("ActivityID","Activity")

features_DF<-read.table("UCI HAR Dataset/features.txt")
colnames(features_DF) <- c("FeatureID","Feature")



#=============Read all the raw files into tables================================
#------------Test data set-----------------------------------------------
X_Test_DF <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_Test_DF <-read.table("UCI HAR Dataset/test/Y_test.txt")
Subject_Test_DF <-read.table("UCI HAR Dataset/test/Subject_test.txt")

#--------------Train data set---------------------------------------------
X_Train_DF <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_Train_DF <-read.table("UCI HAR Dataset/train/Y_train.txt")
Subject_Train_DF<- read.table("UCI HAR Dataset/train/subject_train.txt")

#colnames(Y_Train_DF) <- c("ActivityID")
#colnames(Subject_Train_DF) <- c("SubjectID")



#============== Combine both Train and Test data set =======================

#This is for Criteria 1: Merges the training and the test sets to create one data set.

X_DF <- data.frame()
Y_DF <- data.frame()
Subject_DF <- data.frame()


X_DF <- rbind(X_Test_DF,X_Train_DF)
Y_DF <- rbind(Y_Test_DF,Y_Train_DF)
Subject_DF <- rbind(Subject_Test_DF,Subject_Train_DF)



#=============== Assignn meaningful Column names to Combined data set ===========

#This is for Criteria 4: Appropriately labels the data set with descriptive variable names

#The variable names for X_DF/X_Train/X_Test are stored in  features_DF
names(X_DF) <- features_DF[,2]

names(Y_DF) <- c("ActivityID")
names(Subject_DF) <- c("SubjectID")




#=============== Combined the various data sets into 1 main one================


MainDF <- data.frame()

MainDF <- cbind(X_DF,Subject_DF)
MainDF <- cbind(MainDF,Y_DF)

#This is for Criteria 3: Uses descriptive activity names 
#to name the activities in the data set
MainDF <- join(MainDF,activity_DF, by="ActivityID",type="left")



#==============================================================================

#The grep() function allows you to search for a string/pattern
#In this case, we are subsetting the data with the columns that contains the words
#Subject ID, Activity, mean(), std()

#This is for Criteria 2:
#Extracts only the measurements on the mean and standard deviation 
#for each measurement. 

Mean_Std_DF <- MainDF[,grep("(mean()|std())",colnames(MainDF), ignore.case = TRUE)]

Mean_Std_DF <- cbind(Mean_Std_DF, MainDF$SubjectID)
Mean_Std_DF <- cbind(Mean_Std_DF, MainDF$Activity)




#============================================================================

#This is for Criteria 5:

#From the data set in step 1-4, creates a second, 
#independent tidy data set with the average of each variable for
#each activity and each subject.

#aggregate function is used to summarise the data by
#listing the average of each variable
#by SubjectID and Activity


Avg_BySubjectActivity <- 
  aggregate(Mean_Std_DF[,1:86],
            list(SubjectID = Mean_Std_DF[["MainDF$SubjectID"]],
                 Activity = Mean_Std_DF[["MainDF$Activity"]] ),
            mean)


#=============================================================================

#Export outputs

#This exports the outputs
write.table(Avg_BySubjectActivity, file="Point5_AverageOfMeasurements.txt",row.name = FALSE)
