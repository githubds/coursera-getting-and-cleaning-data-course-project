#Coursera Getting and Cleaning Data project
This repository contains objects related to Coursera's Getting and Cleaning Data project.

##About the data
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##Content in this repository
1. run_analysis.R --Run this file which would read the data and clean them and at the end would create a tidydata.txt containing the tidy data.
2. tidydata.txt --this is the output file you will get after running run_analysis.R containing tidy data.
3. CodeBook.md --Codebook for the tidy data. This document explains how the tidy data has been created.

##Prerequisites
1. All the data files are present in the current working directory where you will run run_analysis.R
2. dplyr, plyr libraries are installed and available in R enviornment

1. y_train.txt 
2. x_train.txt
3. y_test.txt
4. x_test.txt
5. subject_train.txt
6. subject_test.txt 
7. activity_labels.txt
8. features.txt
