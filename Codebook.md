This Code book presents here a simplified and tidy dataset extracted from the original Human Activity Recognition Using Smartphones Dataset version 1.0 

The transforms
==============
The transforms applied on the original datatset from are the following (using the run_analyze.R" script)


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


The simplified dataset description
==================================
The tidy datasets is composed of 180 reccords of 88 variables descibed here:

1- activity_label: factor which represents the name of the activity of the partcicipant during the reccord. It can take one of the 5 following values:
				- WALKING
				- WALKING_UPSTAIRS
				- WALKING_DOWNSTAIRS
				- SITTING
				- STANDING
				- LAYING

2- participant_ID: integer which represent the ID of the participant. It can take a value between 1 and 30 (30 being the number of participants)



The following variables from the 3rd to the 88th are mean and std values of features extracted, after a preprocessing, from accelerometer and gyroscope 3-axial signals tAcc-XYZ and tGyro-XYZ raw data.
These features are normalized and bounded within [-1,1].

To have a better understanding of what exactly represent these features, what preprocessing were applied to raw data before computing these features and others information. It is highly recommended to read the "features_info.txt" file from the original dataset

 
3- tBodyAcc-mean()-X
4- tBodyAcc-mean()-Y
5- tBodyAcc-mean()-Z
6- tBodyAcc-std()-X
7- tBodyAcc-std()-Y
8- tBodyAcc-std()-Z
9- tGravityAcc-mean()-X
10- tGravityAcc-mean()-Y
11- tGravityAcc-mean()-Z
12- tGravityAcc-std()-X
13- tGravityAcc-std()-Y
14- tGravityAcc-std()-Z
15- tBodyAccJerk-mean()-X
16- tBodyAccJerk-mean()-Y
17- tBodyAccJerk-mean()-Z
18- tBodyAccJerk-std()-X
19- tBodyAccJerk-std()-Y
20- tBodyAccJerk-std()-Z
21- tBodyGyro-mean()-X
22- tBodyGyro-mean()-Y
23- tBodyGyro-mean()-Z
24- tBodyGyro-std()-X
25- tBodyGyro-std()-Y
26- tBodyGyro-std()-Z
27- tBodyGyroJerk-mean()-X
28- tBodyGyroJerk-mean()-Y
29- tBodyGyroJerk-mean()-Z
30- tBodyGyroJerk-std()-X
31- tBodyGyroJerk-std()-Y
32- tBodyGyroJerk-std()-Z
33- tBodyAccMag-mean()
34- tBodyAccMag-std()
35- tGravityAccMag-mean()
36- tGravityAccMag-std()
37- tBodyAccJerkMag-mean()
38- tBodyAccJerkMag-std()
39- tBodyGyroMag-mean()
40- tBodyGyroMag-std()
41- tBodyGyroJerkMag-mean()
42- tBodyGyroJerkMag-std()
43- fBodyAcc-mean()-X
44- fBodyAcc-mean()-Y
45- fBodyAcc-mean()-Z
46- fBodyAcc-std()-X
47- fBodyAcc-std()-Y
48- fBodyAcc-std()-Z
49- fBodyAcc-meanFreq()-X
50- fBodyAcc-meanFreq()-Y
51- fBodyAcc-meanFreq()-Z
52- fBodyAccJerk-mean()-X
53- fBodyAccJerk-mean()-Y
54- fBodyAccJerk-mean()-Z
55- fBodyAccJerk-std()-X
56- fBodyAccJerk-std()-Y
57- fBodyAccJerk-std()-Z
58- fBodyAccJerk-meanFreq()-X
59- fBodyAccJerk-meanFreq()-Y
60- fBodyAccJerk-meanFreq()-Z
61- fBodyGyro-mean()-X
62- fBodyGyro-mean()-Y
63- fBodyGyro-mean()-Z
64- fBodyGyro-std()-X
65- fBodyGyro-std()-Y
66- fBodyGyro-std()-Z
67- fBodyGyro-meanFreq()-X
68- fBodyGyro-meanFreq()-Y
69- fBodyGyro-meanFreq()-Z
70- fBodyAccMag-mean()
71- fBodyAccMag-std()
72- fBodyAccMag-meanFreq()
73- fBodyBodyAccJerkMag-mean()
74- fBodyBodyAccJerkMag-std()
75- fBodyBodyAccJerkMag-meanFreq()
76- fBodyBodyGyroMag-mean()
77- fBodyBodyGyroMag-std()
78- fBodyBodyGyroMag-meanFreq()
79- fBodyBodyGyroJerkMag-mean()
80- fBodyBodyGyroJerkMag-std()
81- fBodyBodyGyroJerkMag-meanFreq()
82- angle(tBodyAccMean,gravity)
83- angle(tBodyAccJerkMean),gravityMean)
84- angle(tBodyGyroMean,gravityMean)
85- angle(tBodyGyroJerkMean,gravityMean)
86- angle(X,gravityMean)
87- angle(Y,gravityMean)
88- angle(Z,gravityMean)
 
