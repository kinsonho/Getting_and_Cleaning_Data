library(dplyr)

run_analysis <- function() {
        # Step 0: Read the 561 features vectors from the training and test data set and combine with the activity data set
        train <- read.table(file = "train\\X_train.txt", colClasses = c(numeric()), header = FALSE)
        train_activity <- read.table(file = "train\\y_train.txt", colClasses = c(numeric()), header = FALSE, col.names = c("activity"))
        train_subject <- read.table(file = "train\\subject_train.txt", colClasses = c(numeric()), header = FALSE, col.names = c("subject"))
        
        train <- cbind(train, train_activity, train_subject)
        train$activity <- as.factor(train$activity)
        train$subject <- as.factor(train$subject)
        
        test <- read.table(file = "test\\X_test.txt", colClasses = c(numeric()), header = FALSE)
        test_activity <- read.table(file = "test\\y_test.txt", colClasses = c(numeric()), header = FALSE, col.names = c("activity"))
        test_subject <- read.table(file = "test\\subject_test.txt", colClasses = c(numeric()), header = FALSE, col.names = c("subject"))
        
        test <- cbind(test, test_activity, test_subject)
        test$activity <- as.factor(test$activity)
        test$subject <- as.factor(test$subject)
        
        # Step 1: Combine the training and test data set
        mrg_data <- rbind(train, test)
        
        # Step 2: Extract the mean and standard deviation of each measurement, including the activity (column 562) and subject (column 563)
        mrg_data <- mrg_data[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543,562:563)]
        
        # Step 3: Use descriptive names to describe the activities in the dataset. A new column activity_description is added.
        activity_labels <- read.table(file = "activity_labels.txt", colClasses = c(numeric(), character()),
                                      header = FALSE, col.names = c("activity", "activity_description"))
        
        mrg_data <- merge(mrg_data, activity_labels)
        
        # Step 4: Label the variables with descriptive names
        mrg_data <- rename(mrg_data,
                           tBodyAcc_mean_X = V1, tBodyAcc_mean_Y = V2, tBodyAcc_mean_Z = V3, tBodyAcc_std_X = V4, tBodyAcc_std_Y = V5, tBodyAcc_std_Z = V6,
                           tGravityAcc_mean_X = V41, tGravityAcc_mean_Y = V42, tGravityAcc_mean_Z = V43, tGravityAcc_std_X = V44, tGravityAcc_std_Y = V45, tGravityAcc_std_Z = V46,
                           tBodyAccJerk_mean_X = V81, tBodyAccJerk_mean_Y = V82, tBodyAccJerk_mean_Z = V83, tBodyAccJerk_std_X = V84, tBodyAccJerk_std_Y = V85, tBodyAccJerk_std_Z = V86,
                           tBodyGyro_mean_X = V121, tBodyGyro_mean_Y = V122, tBodyGyro_mean_Z = V123, tBodyGyro_std_X = V124, tBodyGyro_std_Y = V125, tBodyGyro_std_Z = V126,
                           tBodyGyroJerk_mean_X = V161, tBodyGyroJerk_mean_Y = V162, tBodyGyroJerk_mean_Z = V163, tBodyGyroJerk_std_X = V164, tBodyGyroJerk_std_Y = V165, tBodyGyroJerk_std_Z = V166,
                           tBodyAccMag_mean = V201, tBodyAccMag_std = V202,
                           tGravityAccMag_mean = V214, tGravityAccMag_std = V215,
                           tBodyAccJerkMag_mean = V227, tBodyAccJerkMag_std = V228,
                           tBodyGyroMag_mean = V240, tBodyGyroMag_std = V241,
                           tBodyGyroJerkMag_mean = V253, tBodyGyroJerkMag_std = V254,
                           fBodyAcc_mean_X = V266, fBodyAcc_mean_Y = V267, fBodyAcc_mean_Z = V268, fBodyAcc_std_X = V269, fBodyAcc_std_Y = V270, fBodyAcc_std_Z = V271,
                           fBodyAccJerk_mean_X = V345, fBodyAccJerk_mean_Y = V346, fBodyAccJerk_mean_Z = V347, fBodyAccJerk_std_X = V348, fBodyAccJerk_std_Y = V349, fBodyAccJerk_std_Z = V350,
                           fBodyGyro_mean_X = V424, fBodyGyro_mean_Y = V425, fBodyGyro_mean_Z = V426, fBodyGyro_std_X = V427, fBodyGyro_std_Y = V428, fBodyGyro_std_Z = V429,
                           fBodyAccMag_mean = V503, fBodyAccMag_std = V504,
                           fBodyBodyAccJerkMag_mean = V516, fBodyBodyAccJerkMag_std = V517,
                           fBodyBodyGyroMag_mean = V529, fBodyBodyGyroMag_std = V530,
                           fBodyBodyGyroJerkMag_mean = V542, fBodyBodyGyroJerkMag_std = V543
        )
        
        mrg_data
}