CodeBook
========

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Initial data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

R script `run_analysis.R` does the following to clean a data set:

* Reads data set parts: subjects identifiers, lavels indexes, measurements of activities. List of files:

    train/subject_train.txt
    train/y_train.txt
    train/X_train.txt
    train/subject_train.txt
    train/y_train.txt
    train/X_train.txt

* Merges the training and the test data set parts.

* Replace labels indexes with descriptive variable names according to `activity_labels.txt`, transforms labels to lover case:

        walking
        walking_upstairs
        walking_downstairs
        sitting
        standing
        laying

* Uses descriptive activity names to name the activities in the data set according to `features.txt`.

* Extracts only the measurements on the mean and standard deviation for each measurement. Removes brackets from column names and transforms column names to lower case.

* Merges data set parts to create one data set.

* Saves data set as CSV file. Column information:

        "subject" - subject identifier
        "activity" - activity name
        mean and standard deviation values of '-XYZ' signals

* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* Saves a second data set to the txt file.

The following files are created after performing script `run_analysis.R`:

- subjects_activities.csv - a CSV file with merged data set.
- subjects_activities_averages.txt - a text file data set with the average of each variable for each activity and each subject.
