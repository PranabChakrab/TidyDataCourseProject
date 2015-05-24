## Load the required packages
library(utils)
library(plyr)
library(dplyr)
library(reshape2)

## Read the activity labels in a data frame
## Convert the factor values to character strings

activity_labels <- read.table("activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

## Read the features (1-561) in a data frame

features <- read.table("features.txt")

## Read the training data in 3 data frames 
## corresponding to subjects, activities and feature_values

training_subjects <- read.table("./train/subject_train.txt") 
training_activities <- read.table("./train/y_train.txt")
training_features <- read.table("./train/X_train.txt")

## Read the test data in 3 data frames 
## corresponding to subjects, activities and feature_values

test_subjects <- read.table("./test/subject_test.txt")
test_activities <- read.table("./test/y_test.txt")
test_features <- read.table("./test/X_test.txt")

## Merge 3 training data frames to create 1 data frame
## Rename the activity labels with their descriptions
## First two columns of merged data correspond to subject and activity

temp <- join(training_activities, activity_labels, type="inner")
colnames(training_subjects)[1] <- "subject"
colnames(training_features) <- features$V2

## Merge is done through 2 successive cbind() calls

training <- cbind(temp$V2, training_features)
training <- cbind(training_subjects, training)
colnames(training)[2] <- "activity"

## Merge 3 test data frames to create 1 data frame
## Rename the activity labels with their descriptions
## First two columns of merged data correspond to subject and activity

temp <- join(test_activities, activity_labels, type="inner")
colnames(test_subjects)[1] <- "subject"
colnames(test_features) <- features$V2

## Merge is done through 2 successive cbind() calls

test <- cbind(temp$V2, test_features)
test <- cbind(test_subjects, test)
colnames(test)[2] <- "activity"

## Merge the training and test data frames using rbind()

merged_data <- rbind(training, test)

## Create a long and skinny data frame from merged_data 
## All feature names are moved to a column named <variable>
## The values of the features are mapped to a column named <value>
## The function used is melt()

melted_data <- melt(merged_data, id=c("subject", "activity"), measure.vars=features$V2)

## Extract only the rows that have mean or standard deviation measures
## This is done by searching the pattern through grepl()

subset_data <- melted_data[grepl("mean()|std()", melted_data$variable), ]

## Create the tidy_data from subset_data using dcast()
## It contains average of each variable for each activity and each subject

tidy_data <- dcast(subset_data, subject + activity ~ variable, mean)

## Now update the column names of measures by prefixing <average->

colnames(tidy_data)[3:81] <- paste("average", colnames(tidy_data)[3:81], sep = "-")

## Write the output to a text file <tidy_data.txt>
## At the time of reading you may use the following command 
## read.table("tidy_data.txt", header=TRUE, check.names=FALSE)

write.table(tidy_data, "tidy_data.txt", row.names=FALSE, quote=FALSE)