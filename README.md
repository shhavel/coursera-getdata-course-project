Getting and Cleaning Data Course Project
========================================

The goal is to prepare tidy data that can be used for later analysis.

Download zip file with the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Unzip the file in the current working directory of the R process.

Copy file `run_analysis.R` into current working directory and run the script:

```r
source("run_analysis.R")
```

This creates two files in working directory:

- subjects_activities.csv - a CSV file with merged data set.
- subjects_activities_averages.txt - a text file data set with the average of each variable for each activity and each subject.
