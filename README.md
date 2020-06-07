This repository contains 3 files:
=================================

- "README.md": the current file to explain what this repository contains 

- "run_analysis.R" : An R script file to build a smaller simplified tidy dataset from the original 
					(Human Activity Recognition Using Smartphones Dataset version 1.0) dataset downloaded

- "codebook.md" : a file to explain which variables contain the tidy dataset and how they were extacted from the original
				(Human Activity Recognition Using Smartphones Dataset version 1.0) dataset downloaded



The getting and cleaning data course project
============================================
The goal of this project was to obtain a simplified tidy dataset from the original HARUS dataset V1.0 
(Human Activity Recognition Using Smartphones Dataset version 1.0). This dataset may be usefull to build 
a classifier for recognition of 5 human activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

To explain how this simplified tidy datset was obtained it seems important to say a few words about the original 
downloaded HARUS dataset V1.0  
(As I Do not know if I have the right to share the link of the original dataset I do not precise it in this readme file and supposed that you already have it) 

It is highly recommended to read the README of the original dataset which contains more details
to better understand the data. 



a few words about the original dataset
======================================
The original data come from a study that have been carried out with a group of 30 volunteers.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone 
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,
they captured 3-axial linear acceleration and 3-axial angular velocity and manually labeled the data from recorded video.
The sensor signals (accelerometer and gyroscope) were pre-processed to clean the raw data and then
a vector of 561 features was obtained by calculating variables from the time and frequency domain from these pre-processed data
Thus each reccord of the original dataset contained:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

These data were separated in two group: train (70%) and test (30%).

This original dataset contains the files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The tidy dataset and the "run_analyze.R" script
========================================================
In the getting and cleaning data course project the tidy dataset contains only labels, ID of subjects and 
86 specific features (the mean and std  measurements)  as columns. 
And the rows of this dataset correspond to the the average of each variable for each activity and each subject.

To obtain this simplified tidy dataset from the original one , the  "run_analyze.R" script have to be used.
(after downloading the original datset, unzipped it and giving the path of the unzipped rep of the original dataset as mentionned in the first comment of the script)

This script proceeds in 5 steps described here:

1- Merges the training and the test sets to create one data set:  
   a) go the the training rep 'train/'  
   b) load the training data in a dataframe from the txt file 'X_train.txt'  
   c) load the label ID data in a dataframe from  the text file 'y_train.txt' and name the only column 'activity_label'  
   d) load the id of participant in a dataframe from the text file 'subject_train.txt' and name the only column 'participant_ID'  
   e) cbind the three dataframes in a train dataset  
   a')b')c')d')e') do the same with the test data  
   f) merge the train and test datasets using rbind ( no need to use the merge function here)  


2- Extracts only the measurements on the mean and standard deviation for each measurement:  
   a) load the features names from the txt file 'features.txt' and use it to give a name to the feature columns (2:562) of the merged dataset  
   b) extract the column of the merged dataset with a name which contains "mean" or "std" and ofc keep the participant_id and activity_label columns.   
   
   
3- Uses descriptive activity names to name the activities in the data set:  
   a) load the activity names in a dataframe from the txt file 'activity_labels.txt'  
   b) replace the label ID by their label name using mutate function  
   
4- Appropriately labels the data set with descriptive variable names.

5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:  
   a) group the dataset by activity and by subject  
   b) compute the mean of each variable (by activity, by subject) using summarize_all and mean functions  

Notes: in reality the step 4 is done in part during step 1 and before step 2

At the end of the script we save this simplified tidy dataset ("average_activity_tidy_dataset.txt")