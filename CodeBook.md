---
title: "CodeBook: Course Project"
author: "Pranab Chakraborty"
date: "Sunday, May 24, 2015"
output: html_document
---
Coursera course: Getting and Cleaning Data

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

Data: Human Activity Recognition Using Smartphones

Data set for project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Objective:
**Create an independent tidy data set with the average of each variable for each activity and each subject**

Once downloaded and unzipped, keep the run_analyis.R script in the same working directory as the README.txt file of the unzipped raw data set (UCI HAR Dataset). Please source and run it from the same place. 

##Data used in the analysis##

This analysis uses the following files:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The code does not use the Inertial Signals data sets.

To understand the details of the raw variables please refer to the README.txt, features_info.txt, features.txt and activity_labels.txt.

##Variables used in tidy_data##

The following description given in features_info.txt explains the nature of feature variables.

```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
```

The set of variables that were estimated from these signals are different statistical measures and wherever 3-dimensional data have been captured, the variables have been segregated for each of the dimensions (X, Y and Z).

The output of run_analysis.R is a 180 x 81 data.frame. The variables are as follows:

```
subject: int 1:30

```
and 

```
activity: 6 character strings WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

```
For each combination of subject and activity (total 30*6=180), averages of all observations are calculated. I have picked up only those observations that are related to either mean or standard deviation. I have not considered any of the angle variables as they do not directly represent any mean or standard deviation measure. The complete list of 81 column variables are given below out of which 3:81 are numeric variables

```
1                                  subject
2                                 activity
3                average-tBodyAcc-mean()-X
4                average-tBodyAcc-mean()-Y
5                average-tBodyAcc-mean()-Z
6                 average-tBodyAcc-std()-X
7                 average-tBodyAcc-std()-Y
8                 average-tBodyAcc-std()-Z
9             average-tGravityAcc-mean()-X
10            average-tGravityAcc-mean()-Y
11            average-tGravityAcc-mean()-Z
12             average-tGravityAcc-std()-X
13             average-tGravityAcc-std()-Y
14             average-tGravityAcc-std()-Z
15           average-tBodyAccJerk-mean()-X
16           average-tBodyAccJerk-mean()-Y
17           average-tBodyAccJerk-mean()-Z
18            average-tBodyAccJerk-std()-X
19            average-tBodyAccJerk-std()-Y
20            average-tBodyAccJerk-std()-Z
21              average-tBodyGyro-mean()-X
22              average-tBodyGyro-mean()-Y
23              average-tBodyGyro-mean()-Z
24               average-tBodyGyro-std()-X
25               average-tBodyGyro-std()-Y
26               average-tBodyGyro-std()-Z
27          average-tBodyGyroJerk-mean()-X
28          average-tBodyGyroJerk-mean()-Y
29          average-tBodyGyroJerk-mean()-Z
30           average-tBodyGyroJerk-std()-X
31           average-tBodyGyroJerk-std()-Y
32           average-tBodyGyroJerk-std()-Z
33              average-tBodyAccMag-mean()
34               average-tBodyAccMag-std()
35           average-tGravityAccMag-mean()
36            average-tGravityAccMag-std()
37          average-tBodyAccJerkMag-mean()
38           average-tBodyAccJerkMag-std()
39             average-tBodyGyroMag-mean()
40              average-tBodyGyroMag-std()
41         average-tBodyGyroJerkMag-mean()
42          average-tBodyGyroJerkMag-std()
43               average-fBodyAcc-mean()-X
44               average-fBodyAcc-mean()-Y
45               average-fBodyAcc-mean()-Z
46                average-fBodyAcc-std()-X
47                average-fBodyAcc-std()-Y
48                average-fBodyAcc-std()-Z
49           average-fBodyAcc-meanFreq()-X
50           average-fBodyAcc-meanFreq()-Y
51           average-fBodyAcc-meanFreq()-Z
52           average-fBodyAccJerk-mean()-X
53           average-fBodyAccJerk-mean()-Y
54           average-fBodyAccJerk-mean()-Z
55            average-fBodyAccJerk-std()-X
56            average-fBodyAccJerk-std()-Y
57            average-fBodyAccJerk-std()-Z
58       average-fBodyAccJerk-meanFreq()-X
59       average-fBodyAccJerk-meanFreq()-Y
60       average-fBodyAccJerk-meanFreq()-Z
61              average-fBodyGyro-mean()-X
62              average-fBodyGyro-mean()-Y
63              average-fBodyGyro-mean()-Z
64               average-fBodyGyro-std()-X
65               average-fBodyGyro-std()-Y
66               average-fBodyGyro-std()-Z
67          average-fBodyGyro-meanFreq()-X
68          average-fBodyGyro-meanFreq()-Y
69          average-fBodyGyro-meanFreq()-Z
70              average-fBodyAccMag-mean()
71               average-fBodyAccMag-std()
72          average-fBodyAccMag-meanFreq()
73      average-fBodyBodyAccJerkMag-mean()
74       average-fBodyBodyAccJerkMag-std()
75  average-fBodyBodyAccJerkMag-meanFreq()
76         average-fBodyBodyGyroMag-mean()
77          average-fBodyBodyGyroMag-std()
78     average-fBodyBodyGyroMag-meanFreq()
79     average-fBodyBodyGyroJerkMag-mean()
80      average-fBodyBodyGyroJerkMag-std()
81 average-fBodyBodyGyroJerkMag-meanFreq() 

```
