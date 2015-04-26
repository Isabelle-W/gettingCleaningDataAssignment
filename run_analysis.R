## script run_analysis.R
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
## of each variable for each activity and each subject.


## read relevant files
features_list <- read.table("./UCI HAR Dataset/features.txt")
activities_list <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activities_list) <- c("activityID","activity")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activities_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

## merge training and test datasets
all_data <- rbind(data_train,data_test)
all_subjects <- rbind(subject_train,subject_test)
names(all_subjects) <- "subjectID"
all_activities <- rbind(activities_train,activities_test)
names(all_activities) <- "activityID"

# extract columns from all_data where features represent mean() or std()
## and polish column names
colsubset <- grep("mean[(]|std[(]",features_list$V2)
features_subset <- features_list[colsubset,]
features_subset$V2 <- sub("BodyBody","Body",features_subset$V2)
features_subset$V2 <- sub("[(][)]","",features_subset$V2)
data_subset <- all_data[,colsubset]
colnames(data_subset) <- features_subset$V2

## merge subjects, activities and data subset
final_dataset <- cbind(all_subjects,all_activities,data_subset)

# calculate average of each variable for each activity and subject
aggregated_data <-aggregate(final_dataset, by=list(final_dataset$activityID,final_dataset$subjectID),FUN=mean)

## merge activities and reorder by subject ID and activity ID
merged_dataset <- merge(aggregated_data,activities_list,by.x="activityID",by.y="activityID")
merged_dataset <- merged_dataset[order(merged_dataset$subjectID,merged_dataset$activityID),]

## remove unneeded merge columns and rearrange column order as activity is now in last column
tidy_dataset <- merged_dataset[,-(1:3)]
tidy_dataset <- tidy_dataset[,c(1,length(tidy_dataset),3:length(tidy_dataset)-1)] 

## convert into a narrow dataset with 1 variable and 1 average column
library(reshape2)
melted_dataset <- melt(tidy_dataset,id=c("subjectID","activity"),measure.vars=features_subset$V2)
colnames(melted_dataset)[4] <- "average"

## save tidy dataset to file
write.table(melted_dataset,file="./tidy_dataset.txt",row.names=FALSE)

