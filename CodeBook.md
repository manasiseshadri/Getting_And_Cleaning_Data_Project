# Getting\_And\_Cleaning\_Data\_Project
Getting and cleaning data course project

Data source
----------------

Original data: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Original description of the dataset: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


Data Set Information
---------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Data
------

The dataset includes the following files:

'README.txt'

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features.

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

What the run_analysis.r script does
-----------------------------------
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Transformation details
----------------------
The run_analysis.r script:

1. Reads Feature data set into a data frame called "features"
2. Reads test data set:
	a. Reads test subject data set into a data frame called "subject_test" with column name "Subject"
	b. Reads test activity data set into a data frame called "activity_test" with column name "ActivityCode"
	c. Reads test feature values data set into a data frame called "feature_val_test" with column names of corresponding features
3. Reads train data set:
	a. Reads train subject data set into a data frame called "subject_train" with column name "Subject"
	b. Reads train activity data set into a data frame called "activity_train" with column name "ActivityCode"
	c. Reads train feature values data set into a data frame called "feature_val_train" with column names of corresponding features
4. Merges the test and train dataframes into "activity_set", "subject_set", "feature_val_set"
5. Cleans up the workspace by removing unnecessary data objects
6. Creates an empty data frame called "humanActivityDataset" with "Subject", "ActivityCode" and all features.
7. Cleans up the workspace by removing unnecessary data objects
8. Perform step 2 by extracting mean and stddev data in a data frame called "meanStdData"
7. Cleans up the workspace by removing unnecessary data objects
8. Add descriptive activity names by reading Activity labels and merging with humanActivityDataset
9. Aggregate based on Activity and Subject and calculate mean of all aggregated values. Store this into "meanByActivitySubject".
10. Remove extra Subject column in meanByActivitySubject" to create final tidy data set.
11. Write the "meanByActivityDataset" to a file called "step5Dataset.txt"

Cleaned data
--------------
1. Mean and stddev extracted data required in Step 2 is stored in a dataframe called "meanStdData" with the specific feature columns that contain mean or standard deviation data only. [10299 obs of 66 variables]

2. Full dataset in Step 4 is stored in "humanActivityDataset" with columns "ActivityCode", "Subject", "Activity" and 561 feature columns. [10299 obs of 564 variables]

3. Mean of each feature by activity and subject (Step 5) stored in "meanByActivitySubject" with columns "Activity", "Subject" and 561 feature columns [180 obs of 563 variables]

Output file
------------
step5Dataset.txt contains the "meanByActivitySubject" data frame data.



