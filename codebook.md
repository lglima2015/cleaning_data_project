CodeBook
==============
This document describes the tidy output dataset as result from run_analysis.R script:

#Data Source
The source data set contains the data collected from the accelerometers from the Samsung Galaxy S smartphone. The data set can be downloaded from here: [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Please, read the Readme.md file to know more about this dataset.

#Source files used to create tidy dataset

* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all featuresst.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.
* train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* activity_labels.txt: Links the class labels with their activity name

#Variables

* Activity - contain th values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* Subject - the subjects are represented as a number from 1 to 30

 All the other variables are averages of measures the accelerometer and gyroscope 3-axial raw signals extracted from UCI HAR Dataset.
To understand better what are this measures, please read de features_info.txt file inside the zip file downloaded. check [Readme.md](https://github.com/lglima2015/cleaning_data_project/blob/master/README.md)
The names of variables are created based always the origin names from features selected in the experiment.
TimeBodyAccMeanX 
,TimeBodyAccMeanY
,TimeBodyAccMeanZ
,TimeGravityAccMeanX
,TimeGravityAccMeanY
,TimeGravityAccMeanZ
,TimeBodyAccJerkMeanX
,TimeBodyAccJerkMeanY
,TimeBodyAccJerkMeanZ
,TimeBodyGyroMeanX
,TimeBodyGyroMeanY
,TimeBodyGyroMeanZ
,TimeBodyGyroJerkMeanX
,TimeBodyGyroJerkMeanY
,TimeBodyGyroJerkMeanZ
,TimeBodyAccMagMean
,TimeGravityAccMagMean
,TimeBodyAccJerkMagMean
,TimeBodyGyroMagMean
,TimeBodyGyroJerkMagMean
,FreqBodyAccMeanX
,FreqBodyAccMeanY
,FreqBodyAccMeanZ
,FreqBodyAccMeanFreqX
,FreqBodyAccMeanFreqY
,FreqBodyAccMeanFreqZ
,FreqBodyAccJerkMeanX
,FreqBodyAccJerkMeanY
,FreqBodyAccJerkMeanZ
,FreqBodyAccJerkMeanFreqX
,FreqBodyAccJerkMeanFreqY
,FreqBodyAccJerkMeanFreqZ
,FreqBodyGyroMeanX
,FreqBodyGyroMeanY
,FreqBodyGyroMeanZ
,FreqBodyGyroMeanFreqX
,FreqBodyGyroMeanFreqY
,FreqBodyGyroMeanFreqZ
,FreqBodyAccMagMean
,FreqBodyAccMagMeanFreq
,FreqBody2BodyAccJerkMagMean
,FreqBody2BodyAccJerkMagMeanFreq
,FreqBody2BodyGyroMagMean
,FreqBody2BodyGyroMagMeanFreq
,FreqBody2BodyGyroJerkMagMean
,FreqBody2BodyGyroJerkMagMeanFreq
,TimeBodyAccStdX
,TimeBodyAccStdY
,TimeBodyAccStdZ
,TimeGravityAccStdX
,TimeGravityAccStdY
,TimeGravityAccStdZ
,TimeBodyAccJerkStdX
,TimeBodyAccJerkStdY
,TimeBodyAccJerkStdZ
,TimeBodyGyroStdX
,TimeBodyGyroStdY
,TimeBodyGyroStdZ
,TimeBodyGyroJerkStdX
,TimeBodyGyroJerkStdY
,TimeBodyGyroJerkStdZ
,TimeBodyAccMagStd
,TimeGravityAccMagStd
,TimeBodyAccJerkMagStd
,TimeBodyGyroMagStd
,TimeBodyGyroJerkMagStd
,FreqBodyAccStdX
,FreqBodyAccStdY
,FreqBodyAccStdZ
,FreqBodyAccJerkStdX
,FreqBodyAccJerkStdY
,FreqBodyAccJerkStdZ
,FreqBodyGyroStdX
,FreqBodyGyroStdY
,FreqBodyGyroStdZ
,FreqBodyAccMagStd
,FreqBody2BodyAccJerkMagStd
,FreqBody2BodyGyroMagStd
,FreqBody2BodyGyroJerkMagStd

#Transformations
* The training data and test data was unified in one dataset.
* the activity values was replaced for descriptive activity names.
* the only mean and standard deviation measures was selected to create the dataset from origin data.
* The names of variables has been changed to appropriately labels to became more easy to understand what are the measures.
* the prefix t and f was replaced by Time an Freq.
* the symbols like "()" and "-" was removed.
* the variables names are transformed in Pascal case style.
* "*bodybody*" pattern inside variable names became "*Body2Body*"
* Finnaly, the origin dataset was grouped by Activity and Subject and summarized by Mean.
* The Results were output as an indepenent tidy data set.order by activity and subject.
