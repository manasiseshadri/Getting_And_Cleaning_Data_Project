# Getting\_And\_Cleaning\_Data\_Project
Getting and cleaning data course project

Steps to run the run_analysis.r script
======================================

1. In R session, change your working directory to this directory (using setwd)
2. Download Samsung data set (zip) into the working directory and unzip the file. A directory called "UCI HAR Dataset" will be created with all data files.
3. Open run_analysis.r and run each line in the R script in the R session
4. At the end of the script, a file called "step5Dataset.txt" will be created. This is the final output file as required in Step 5.


What run_analysis.r does
========================
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


