#####################################################
#Run this program in the working directory where all the following files exist,
#	y_train.txt, x_train.txt, y_test.txt
#	x_test.txt, subject_train.txt, subject_test.txt 
#	activity_labels.txt, features.txt
#
#this program will write tidy data to tidydata.txt file in the working directory
#
#High level logic: Read the files > add variables to the data > add activity, subject variables to the data
#		> merge the data > get mean, std variables only > join data to get activity names
#		> get avg of all variables by subject, activity
#		> write tidydata to tidydata.txt
#####################################################


####load the required libraries
library(dplyr)
library(plyr)

####read the train data
xtrain<-read.table("X_train.txt",sep="")
ytrain<-read.table("y_train.txt",sep="",col.names="activityid")
subjecttrain<-read.table("subject_train.txt",sep="",col.names="subjectid")


####read the test data
xtest<-read.table("X_test.txt",sep="")
ytest<-read.table("y_test.txt",sep="",col.names="activityid")
subjecttest<-read.table("subject_test.txt",sep="",col.names="subjectid")

####read the other files
features<-read.table("features.txt",sep="")
activity_labels<-read.table("activity_labels.txt",sep="",col.names=c("activityid","activityname"))


####Appropriately labeling the data set with descriptive variable names
names(xtrain)<-features$V2
names(xtest)<-features$V2

xtest<-cbind(subjecttest,xtest)	
xtest<-cbind(xtest,ytest)
xtrain<-cbind(subjecttrain,xtrain)	
xtrain<-cbind(xtrain,ytrain)
mergeddata<-rbind(xtest,xtrain)

####Extracts only the measurements on the mean and standard deviation for each measurement. 
mergeddata<-mergeddata[,c(1,grep("mean",names(mergeddata)),grep("std",names(mergeddata)),length(names(mergeddata)))]

####Uses descriptive activity names to name the activities in the data set
mergeddata<-join(mergeddata,activity_labels)


####From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##group by subjectid, activityid
groupcols<-c("subjectid","activityid","activityname")

##columns to be grouped are all mean, std variables other than "subjectid","activityid","activityname"
datacols<-names(mergeddata)[!names(mergeddata) %in% c("subjectid","activityid","activityname")]

##using ddply get the average of each variable for each activity and each subject
tidydata<-ddply(mergeddata,groupcols,function(x) colMeans(x[,datacols]))

write.table(tidydata,file="tidydata.txt",row.name=FALSE)
