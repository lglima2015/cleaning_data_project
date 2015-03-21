Cleaning data Course Project
===========
This is the guide for anyone who wants run the the script named run_analysis from Cleaning Data Course Project.
It's very easy! all you need is described below!

You should:

* Step 1 - Clone this git repository;
* Step 2 - Download the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip);
* Step 3 - Extract the zip file in your home directory;
* Step 4 - Copy the run_analysis.R script from your clone directory to UCI HAR Dataset directory;
* Step 5 - Open R or RStudio and set your work directory to UCI HAR Dataset directory using the setwd() command;
* Step 6 - Execute run_analysis.R scprit.

# run_analysis.R script
access here: [run_anlysis.R](https://github.com/lglima2015/cleaning_data_project/blob/master/run_analysis.R) is a script 

## What this script does: 
Transform the Human Activity Recognition Using Smartphones DataSet in a Tidy Data Format based on Clean Data Analysis Course Project.
The script contains 5 functions: 

### mergeTraintest 
Merges the training and the test sets to create one data set.

### extractMeansAndDeviations
Extracts only the measurements on the mean and standard deviation for each measurement. 

### setDescriptiveActivity 
Uses descriptive activity names to name the activities in the data set.

### setAppropriatelyLabels
Appropriately labels the data set with descriptive variable names.

### createAverages.
Create averages in data set and change to tidy format.

#Code Book
The code book describe what are the variables contained in tidy dataset as result of run_analysis script.
The code book always explains what the transformation was choosed in UCI HAR Dataset to achieve tidy data.
to access Code book, click [here](https://github.com/lglima2015/cleaning_data_project/blob/master/run_analysis.R)

#References
About wearable computing read [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/)
About the UCI Har Dataset, access [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)



