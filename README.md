## Creation of a tidy data set

This project uses data from a study of wearable computing, which is described here in detail:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script run_analysis.R in this folder transforms the raw data into a tidy dataset that merges the test and training set, names the variables appropriately, selects the desired columns and creates a new tidy data set with the average of each variable for each activity and each subject. 

Before running the script, the raw data must be downloaded from the following URL and unzipped in the working directory. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The file used to create the script was downloaded on December 13, 2014. 

The analysis requires the package "dplyr". If not already installed on the system, first run in R: install.packages("dplyr"). The script relies on dplyr version 0.3. 

Detailed description of the script:

The files with the test and training set data, the activity labels and the subject number are read into R data frames, as well as the names of the features and activities. 

The column names are assigned descriptive names using the names of the features, which are given in the feature name file. The names contain information about what type of movement was measured in which direction. The detailed description of the names and their meaning can be found in the codebook in this directory. 

The activity label and subject number are added to the test and training data frames, and those are merged into a single large data frame. 

The activity label, which initially is just a number, is converted to a factor for which the appropriate descriptive name is added as a factor level. 

We extract only the columns we are interested in, namely any column which is a mean or standard deviation. Only variables with mean() at the end are selected, because some variables such as a "mean frequency" are not actual mean measurements and do not have corresponding standard deviations. 

The variable names are altered by removing brackets and replacing dashes with underscores, because these characters cannot easily be handled by R for subsetting by name. 

The data frame is converted into a dplyr object which simplifies operations on groups. 

The data is grouped by activity and subject, and the mean calculated for each column for each such group. 

The data frame is converted back to a normal data frame and "mean_" is added to the beginning of the column names. 

The final tidy data set is then written into a text file. The file can be read back into R by using the command: tidydata <- <- read.table("tidydata.txt",header=TRUE)

