#Feature
features <- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE, col.names = c("FeatureIndex", "Feature"))

# Test set
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names = c("Subject"))
activity_test <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names = c("ActivityCode"))
feature_val_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE, col.names = c(as.character(features$Feature)))

#Train set
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names = c("Subject"))
activity_train <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names = c("ActivityCode"))
feature_val_train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE, col.names = c(as.character(features$Feature)))

#Merge datasets
activity_set <- rbind(activity_test, activity_train)
subject_set <- rbind(subject_test, subject_train)
feature_val_set <- rbind(feature_val_test, feature_val_train)

#Cleanup workspace
rm(list = c("activity_test", "activity_train", "feature_val_test", "feature_val_train", "subject_test", "subject_train"))

#Final empty data frame with columns
humanActivityDataset <- cbind(subject_set, activity_set, feature_val_set)

#Cleanup workspace
rm(list = c("activity_set", "feature_val_set", "subject_set"))

#Extract mean and std data
meanData <- humanActivityDataset[grep(".mean.", colnames(humanActivityDataset), fixed = TRUE)]
stdData <- humanActivityDataset[grep(".std.", colnames(humanActivityDataset), fixed = TRUE)]
meanStdData <- cbind(meanData, stdData)

#Cleanup workspace
rm(list = c("meanData", "stdData"))

#Add descriptive activity names
activity <- read.csv("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep="", col.names=c("ActivityCode", "Activity"))
humanActivityDataset <- merge(humanActivityDataset, activity, by="ActivityCode", all=FALSE)

#Mean by activity and subject
meanByActivitySubject <- aggregate(humanActivityDataset[,colnames(humanActivityDataset[3:ncol(humanActivityDataset)-1])], list(Activity=humanActivityDataset$Activity, Subject=humanActivityDataset$Subject), mean)
meanByActivitySubject <- meanByActivitySubject[,-3]

#Write to file
write.table(meanByActivitySubject, file = "step5Dataset.txt", row.names = FALSE)
