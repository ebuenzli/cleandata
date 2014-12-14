# creates a tidy data set

library(dplyr)

dir = 'UCI HAR Dataset/'

# assign all filenames to read
trainXfile = paste0(dir,'train/X_train.txt')
trainYfile = paste0(dir,'train/y_train.txt')
trainSfile = paste0(dir,'train/subject_train.txt')
featfile = paste0(dir,"features.txt")
actfile = paste0(dir,"activity_labels.txt")  
testXfile = paste0(dir,'test/X_test.txt')
testYfile = paste0(dir,'test/y_test.txt')
testSfile = paste0(dir,'test/subject_test.txt')

# read in all files
trainX <- read.table(trainXfile)
trainY <- read.table(trainYfile)
trainS <- read.table(trainSfile)
testX <- read.table(testXfile)
testY <- read.table(testYfile)
testS <- read.table(testSfile)
feat <- read.table(featfile)
act <- read.table(actfile)

# assign feature names
names(trainX) <- feat[,2]
names(testX) <- feat[,2]
names(trainY) <- "Activity"
names(testY) <- "Activity"
names(trainS) <- "Subject"
names(testS) <- "Subject"

# merge all data
train <- cbind(trainX,trainY,trainS)
test <- cbind(testX,testY,testS)
all <- rbind(train,test)

# replace activity label by descriptive name
all[,"Activity"] <- as.factor(all[,"Activity"])
levels(all[,"Activity"]) <- act[,2]

# find columns which are mean and standard deviation
ind_mean <- grep("mean()",feat[,2],fixed=TRUE)
ind_std <- grep("std",feat[,2],fixed=TRUE)

# extract only relevant columns
use <- all[,sort(c(ind_mean,ind_std,562,563))]

names(use) <- gsub("()","",names(use),fixed=TRUE)
names(use) <- gsub("-","_",names(use),fixed=TRUE)

# calculate mean of dataset by activity and subject, using dplyr
tbl_use <- tbl_df(use)
by_group <- group_by(tbl_use,Activity,Subject)
means <- summarise_each(by_group,funs(mean))

# recovert to normal data frame
final <- data.frame(means)
# add mean to colum name
names(final)[-(1:2)] <- as.character(lapply(names(final[-(1:2)]),function(x) paste0("mean_",x)))

# writing out data to text file
write.table(final,file="tidydata.txt",row.names=FALSE)

# to read in tidy data set use:
# tidydata <- read.table("tidydata.txt",header=TRUE)

               
               