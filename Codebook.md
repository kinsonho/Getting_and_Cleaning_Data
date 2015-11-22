# Codebook

The run_analysis.R analyze the data collected from the accelerometers from the Samsung Galaxy S smartphone. The data set is available in (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Execution of the run_analysis function will output a tidy data set with the following variables:  
* activity: The activity number, ranges from 1 to 6  
* subject: The subject the performs the activity, ranges from 1 to 30  
* activity_description: The description for each activity number as defined in the activity_labels.txt  
* all other variables: All other variables specify the average of the variable values for the given activity performed by the given subject. The specific meaning of a variable can be found in features.txt and features_info.txt from the data set.  

## Methodology

The tidy data set output by run_analysis performs the following data processing steps:  
* Load the training dataset, training subject and training activity from X_train.txt, subject_train.txt and y_train.txt respectively  
* Combine the three sets of training data into a combined training dataset  
* Load the test dataset, test subject and test activity from X_test.txt, subject_test.txt and y_test.txt respectively  
* Combine the three sets of test data into a combined test dataset  
* The data loaded is represented in decimal number, rather than using exponential  
* Merge the combined training dataset and combined test dataset to form a merged dataset  
* Extract only the measurements on the mean and standard deviation for each measurement  
* A new variable called activity_description is added to the dataset. This activity_description provides the corresponding activity description according to the activity number  
* Each variable is labelled with the corresponding activity name obtained from features.txt  
* Finally for each activity and each subject, an average value for each variable is calculated and returned in the output tidy data set