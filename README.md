---
title: "README.md"
author: "Pranab Chakraborty"
date: "Sunday, May 24, 2015"
output: html_document
---

# TidyDataCourseProject: README File #

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

This document explains how the script works and how the analysis was done. 

## How to run the code? ##

To run the run_analysis.R code -

* Place it in the unzipped folder of "UCI HAR Dataset" at the same level as "README.txt" file
* Set the working directory in R to "UCI HAR Dataset" 
* Source the file in that location using the command: source("run_analysis.R")
* The output file name will be "tidy_data.txt"
* You may read the file using: tidy <- read.table("tidy_data.txt", header=TRUE, check.names=FALSE)
* After that you may view the result using: View(tidy)

## What are the pre-requisites? ##

The code uses the following libraries -

* library(utils)
* library(plyr)
* library(dplyr)
* library(reshape2)

So if these packages are not installed already in your R environment, then install those using "install.packages("...") commands as given below -

* install.packages("utils")
* install.packages("plyr")
* install.packages("dplyr")
* install.packages("reshape2")

## How does the code work? ##

Let us first look at the **Analysis plan** and then the **Analysis steps** that were used in this project to create the tidy data.

## Analysis plan ##

The following observations were made on the original data set

* Both training and test data contain 561 feature observations per row
* There are 7352 rows in training and 2947 rows in test data ("X_train.txt" and "X_test.txt")
* The subject and activity data sets for training contain 7352 rows
* The subject and activity data sets for test contain 2947 rows
* The descriptive labels of activities are present in "activity_labels.txt"
* The descriptive labels of features are present in "features.txt"
* There are 79 features that are mean or standard deviation measures

This means -

* Training data set (3 tables) can first be combined to form 1 table (column binding)
* Test data set (3 tables) can then be combined to form another table (column binding)
* These two tables can then be combined by row binding
* Then we need to take a subset of this data where only the required 79 features are present
* Subsequently we have to take the average of each variable for each activity and each subject
* The Intertial_Signals data sets can be ignored for the sake of this analysis

## Analysis steps ##

1. First read the activity labels in a data frame
2. Next read the features (1-561) in a data frame
3. Read the training data in 3 data frames corresponding to subjects, activities and feature_values
4. Read the test data in 3 data frames corresponding to subjects, activities and feature_values
5. Merge 3 training data frames to create 1 data frame
6. Merge 3 test data frames to create 1 data frame
7. Rename the activity labels with their descriptions
8. Merge the training and test data frames using rbind()
9. Create a long and skinny data frame from the merged data in which 
   + All feature names are moved to a column named "variable"
   + The values of the features are mapped to a column named "value"
   + The function used is melt()
10. Extract only the rows that have mean or standard deviation measures
11. This is done by searching the pattern through grepl()
12. Create the tidy_data from subset_data using dcast()
13. It contains average of each variable for each activity and each subject
14. Now update the column names of measures by prefixing "average-" except for the first two columns
15. Write the output to a text file "tidy_data.txt"





