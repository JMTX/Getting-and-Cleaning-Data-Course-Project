rm(list=ls())
library("dplyr")

#go to the dataset directory - fill the following variable cur_dir_path with the path of the directory where
#you unzipped the dataset files.
cur_dir_path =""
setwd(cur_dir_path)

setwd("./UCI\ HAR\ Dataset")
dataset_dir <- getwd()
getwd()

#------------------------------------------------------------------------
# STEP 1:  Merges the training and the test sets to create one data set.
#------------------------------------------------------------------------

#go into the train directory 
setwd("./train")



#load the train data into three variables:
#train_x a dataframe which will contains the training data
#train_id a dataframe which will contain the ID of participants in train group
#train_label dataframe which will contain the activity labels (walking, running, etc...) in train group

train_x<-read.table("X_train.txt")

train_id<-read.table("subject_train.txt")
names(train_id)<-"participant_ID"

train_label<-read.table("y_train.txt")
names(train_label)<-"activity_label"

#cbind the three previous dataframe in train_x dataframe
train_x<-cbind(train_id,train_x,train_label)

#free some space removing the train_id and train_label dataframe
rm("train_id","train_label")

#go into the test directory
setwd("../test")

#load the test data into three variables:
#test_x a dataframe which will contains the test data
#test_id a dataframe which will contain the ID of participants in test group
#test_label dataframe which will contain the activity labels (walking, running, etc...) in test group
test_x<-read.table("X_test.txt")

test_id<-read.table("subject_test.txt")
names(test_id)<-"participant_ID"

test_label<-read.table("y_test.txt")
names(test_label)<-"activity_label"

#cbind the three previous dataframe in train_x dataframe
test_x<-cbind(test_id,test_x,test_label)

#free some space removing the test_id and test_label dataframe
rm("test_id","test_label")


#merge the train and test data in a dataframe called raw_dataset
raw_dataset <-rbind(train_x,test_x)
rm(test_x,train_x)

#---------------------------------------------------------------------------------------------
#STEP 4: Appropriately labels the data set with descriptive variable names.

#Notes: o STEP 4 is done before to make STEP 2 easier to do
#       o a part of STEP 4 was done during STEP 1
#---------------------------------------------------------------------------------------------

#go in the datatset directory, load the feature names and give the correct label to the dataset
setwd(dataset_dir)
features_names<-read.table("features.txt")
colnames(raw_dataset)[2:562]<-as.character(features_names[,2])

#----------------------------------------------------------------------------------------------
#STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement
#----------------------------------------------------------------------------------------------
#search the col of mean and std measures in the dataset and keep only these ones
#(we considered "meanFreq" as a mean value)
mean_std_cols<-c(1, grep("mean|std", tolower(names(raw_dataset))),563)
raw_dataset<-raw_dataset[,mean_std_cols]

#----------------------------------------------------------------------------------------------
#STEP 3: Uses descriptive activity names to name the activities in the data set
#----------------------------------------------------------------------------------------------
#load activity labels character 
activity_names<-read.table("activity_labels.txt")

#replace the activity id in the dataset by the activity names
raw_datasets2<-mutate(raw_dataset,activity_label = (function(x){activity_names[x,2]})(activity_label))

#-------------------------------------------------------------------------------------------------
#STEP 5: From the data set in step 3 (as step4 was done before), creates a second, independent tidy data set with the average
#        of each variable for each activity and each subject
#-------------------------------------------------------------------------------------------------
tidy_dataset <- group_by(raw_datasets2,,activity_label,participant_ID,)%>%summarize_all(funs(mean))

#go in the datatset directory
setwd(dataset_dir)

#save the dataset
write.table(tidy_dataset, "average_activity_tidy_dataset.txt",row.names=FALSE )