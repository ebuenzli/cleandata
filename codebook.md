## Codebook for the tidy dataset created by run_analysis.R

See README.md for information on how the variables were derived from the raw dataset. 

Description of the columns (features) in the dataset:

Activity: The activity the subject was performing during the measurement. Factor with 6 levels: Walking, Walking upstairs, walking downstairs, sitting, standing, laying

Subject: The ID number of the person doing the activity

The remaining 66 colums were derived from the accelerometer and gyroscope measurements. The units of all variables are the same as in the original measurements since we did not make any transformations.  

mean_tBodyAcc_[mean|std]_[X|Y|Z]
mean_tGravityAcc_[mean|std]_[X|Y|Z]
mean_tBodyAccJerk_[mean|std]_[X|Y|Z]
mean_tBodyGyro_[mean|std]_[X|Y|Z]
mean_tBodyGyroJerk_[mean|std]_[X|Y|Z]
mean_tBodyAccMag_[mean|std]
mean_tGravityAccMag_[mean|std]
mean_tBodyAccJerkMag_[mean|std]
mean_tBodyGyroMag_[mean|std]
mean_tBodyGyroJerkMag_[mean|std]
mean_fBodyAcc_[mean|std]_[X|Y|Z]
mean_fBodyAccJerk_[mean|std]_[X|Y|Z]
mean_fBodyGyro_[mean|std]_[X|Y|Z]
mean_fBodyAccMag_[mean|std]
mean_fBodyAccJerkMag_[mean|std]
mean_fBodyGyroMag_[mean|std]
mean_fBodyGyroJerkMag_[mean|std]

Here the brackets [mean|std] and [X|Y|Z] mean the following: There is one variable each for each possible combination where one of the listed options is selected. 

Each variable was derived as the mean over all measurements for one person and one activity, this is depicted by the mean_ at the beginning. The second block describes the type of the measurement, these are detailed in feature_info.txt located in the dataset (see README.md for information). mean or std say whether this variable was derived as the the mean or the standard deviation over the measurements in a single trial. X,Y and Z depict the direction in which the measurement was taken in 3 dimensions. 