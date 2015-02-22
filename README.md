# getting-cleaning-data, Coursera course project

This file describes how run_analysis.R

* First, unzip the data provided for the exercise: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Second, make sure your working directory in R points to the uncompress folder, which contains the test and train folders
* Third, RStudio run source("run_analysis.R"), that would generate the following tables:
* 
..* A data frame called mergedTable, which has a 10299*81 dimension, it is a merge from train and test table, with the correct labels for Activities, and with only mean and std columns (*requirements on points 1,2,3,4*)

..* A data frame called summarizedTable, which has a 180*81 dimension (*requirements on point 5*)
