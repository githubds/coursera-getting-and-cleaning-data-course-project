#This document explains the followings,-
1. The variables in the tidydata
2. Tidy data
3. How Raw data is cleaned up to arrive the tidy data


##Variables in the tidydata
* subjectid
* activityid
* activityname
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyAccMag-mean()
* tGravityAccMag-mean()
* tBodyAccJerkMag-mean()
* tBodyGyroMag-mean()
* tBodyGyroJerkMag-mean()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-meanFreq()
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-std()
* tGravityAccMag-std()
* tBodyAccJerkMag-std()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-std()
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-std()

##Tidy data
Tidy data is the average of all the variables grouped by subjectid, activityid, activityname variables;
check tidydata.txt file to see the actual data;

##How raw data is cleaned up to arrive at the tidy data

Get libraries dplyr, plyr

Read all the files. When reading y_test.txt, subject_test.txt, activity_labels.txt files assign the variable names (as per the step "Appropriately labels the data set with descriptive variable names.")
Assign variable names to traning and test data from file features.txt
Add subject (people id), activity id data to training and test data using cbind command.

####Merges the training and the test sets to create one data set.
merge training and test data using merge command.

####Extracts only the measurements on the mean and standard deviation for each measurement. 
Extracts only the measurements on the mean and standard deviation for each measurement using mergeddata and grep commands.

####Uses descriptive activity names to name the activities in the data set
Join activity_labels to get the activity name using join command. activity_id is the common variable name.

####Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Use colsums and is.na commands manually to check if any variable has NA values. Once you see the data does not have any null values, calculate the average of all variables using ddply command grouped by subjectid, activityid, activityname.	

Use write.table command to write to tidydata.txt with no rownames option.