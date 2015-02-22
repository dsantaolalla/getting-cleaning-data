# getting-cleaning-data, Coursera course project

This file describes how run_analysis.R

* First, unzip the data provided for the exercise: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Second, make sure your working directory in R points to the uncompress folder, which contains the test and train folders
* Third, RStudio run source("run_analysis.R"), that would generate the following tables:
  * A data frame called mergedTable, which has a 10299 X 81 dimension, it is a merge from train and test table, with the correct labels for Activities, and with only mean and std columns (**requirements on points 1,2,3,4**), merged-table.txt
  * A data frame called summarizedTable, which has a 180 X 81 dimension (**requirements on point 5**), summarized-table.txt

I submitted a dump of both results, in a txt format (merged-table.txt and summarized-table.txt), so it can be reviewed easily

## What the analysis script does:

* We create a list with the mesurement columns which we would like to select, the ones containing .mean() or .std() in the label
* We read the test mesurements file and store it in a data.frame
* We create a subset of the data.frame with only the columns we want to keep
* We add into the dataframe an extra column for the subjectId
* We add into the dataframe an extra column for activity, and later replacing the value by the label contained in the file

* We read the train mesurements file and store it in a data.frame
* We create a subset of the data.frame with only the columns we want to keep
* We add into the dataframe an extra column for the subjectId
* We add into the dataframe an extra column for activity, and later replacing the value by the label contained in the file

* We concatenate in one data.frame the filtered/modified test and train dataframes
* On the resulting dataset we group by activity and subjectId columns and make an average of the resulting mesurements

