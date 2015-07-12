# Install package "data.table" if missing
if (!"data.table" %in% installed.packages()[,"Package"]) install.packages("data.table")
library(data.table)

# Read data set parts (subjects, lavels indexes, measurements of activities).
subject_train <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'train', 'subject_train.txt'), header = FALSE, col.names = c("subject"))
y_train <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'train', 'y_train.txt'), header = FALSE, col.names = c("activity"))
x_train <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'train', 'X_train.txt'), header = FALSE)

subject_test <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'test', 'subject_test.txt'), header = FALSE, col.names = c("subject"))
y_test <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'test', 'y_test.txt'), header = FALSE, col.names = c("activity"))
x_test <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'test', 'X_test.txt'), header = FALSE)

# Merge the training and the test data set parts.
subject <- rbind(subject_train, subject_test)
y <- rbind(y_train, y_test)
x <- rbind(x_train, x_test)

# Replace labels indexes with descriptive variable names.
activity_labels <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'activity_labels.txt'), header = FALSE)
y[, 1] <- sapply(y[, 1], function (n) tolower(activity_labels[, 2][n]))

# Use descriptive activity names to name the activities in the data set.
features <- read.table(file.path(getwd(), 'UCI HAR Dataset', 'features.txt'), header = FALSE)
names(x) <- features[, 2]

# Extract only the measurements on the mean and standard deviation for each measurement.
x <- x[, names(x)[grepl("mean\\(\\)|std\\(\\)", names(x))]]
names(x) <- tolower(gsub("\\(|\\)", "", names(x))) # Remove brackets from column names and transforms to lower case (optional).

# Merge data sets parts into one data set.
subj_act <- data.table(cbind(subject, y, x))
write.csv(subj_act, row.names = FALSE, file = "subjects_activities.csv") # Optional.

# Create a data set with the average of each variable for each activity and each subject.
subj_act_avg <- subj_act[, lapply(.SD, mean), by = c("subject", "activity")]

# Write into file.
write.table(subj_act_avg, row.name = FALSE, file = "subjects_activities_averages.txt")
