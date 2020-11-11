library(dplyr)
## Read data sets
XTrain <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\train\\X_train.txt")
str(XTrain) ## 7352 obs. of  561 variables
yTrain <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\train\\y_train.txt")
str(yTrain) ## 7352 obs. of  1 variable
subjectTrain <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\train\\subject_train.txt")
str(subjectTrain) ## 7352 obs. of  1 variable
XTest <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\test\\X_test.txt")
str(XTest) ## 2947 obs. of  561 variables
yTest <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\test\\y_test.txt")
str(yTest) ## 2947 obs. of  1 variable
subjectTest <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\test\\subject_test.txt")
str(subjectTest) ## 2947 obs. of  1 variable
activity <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\activity_labels.txt")
activity <- rename(activity, activity=V2)
features <- read.table("C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\features.txt")
# 1.Merges the training and the test sets to create 
# one data set.
## Check if the XTrain and XTest have the same variables
XTrainVar <- names(XTrain)
XTestVar <- names(XTest)
all.equal(XTrainVar,XTestVar)
## Both data sets have the same 561 variables 
## rbind test files and train files
### XTrain and XTest
X <- rbind(XTrain, XTest)
#### X has 561 variables that are not human readable

#### Features describes those variables
names(X) <- features$V2
### yTrain and yTest, and name the variable name "activity"
y <- rbind(yTrain, yTest)
names(y) <- "activity"
### subjectTrain and subjectTest, and name the variable name "subject"
subject <- rbind(subjectTrain,subjectTest)
names(subject) <- "subject"
## cbind subject, X, and y
DF <- cbind(subject, X)
DF <- cbind(DF, y)
# 2. Extracts only the measurements on the mean and 
# standard deviation for each measurement.
## Specifying variable names containing "mean" or"std" 
mVec <- grep("mean", names(DF), value = TRUE)
sDVec <- grep("std", names(DF), value = TRUE)
## Extracts columns for both cases
DFM <- DF[names(DF) %in% mVec]
DFSD <- DF[names(DF %in% sDVec)]
DF_clean <- cbind(DFM, DFSD)
# 3.  Uses descriptive activity names to name the 
#     activities in the data set
DF <- merge(DF, activity, by.x="activity", by.y="V1")
names(DF)
# 4.  Appropriately labels the data set with descriptive 
#     variable names. This process was done in the step 1
library(stringr)
## Attaching "-X" for column names  
## from 305 to 318
## from 384 to 397
## from 463 to 476
XVec <- c(rep("-X",14))
names(DF)[305:318] <- paste0(names(DF[,305:318]),XVec)
names(DF)[384:397] <- paste0(names(DF[,384:397]),XVec)
names(DF)[463:476] <- paste0(names(DF[,463:476]),XVec)
## Attaching "-Y" for column names  
## from 319 to 332
## from 398 to 411
## from 477 to 490
YVec <- c(rep("-Y",14))
names(DF)[319:332] <- paste0(names(DF[,319:332]),YVec)
names(DF)[398:411] <- paste0(names(DF[,398:411]),YVec)
names(DF)[477:490] <- paste0(names(DF[,477:490]),YVec)
## Attaching "-Z" for column names  
## from 333 to 346
## from 412 to 425
## from 491 to 504
ZVec <- c(rep("-Z",14))
names(DF)[333:346] <- paste0(names(DF[,333:346]),ZVec)
names(DF)[412:425] <- paste0(names(DF[,412:425]),ZVec)
names(DF)[491:504] <- paste0(names(DF[,491:504]),ZVec)
table(duplicated(names(DF)))
### Now no duplicates
## Unnecessary () shoule be removed
names(DF) <- sub("\\()","",names(DF))
## Prefix "t" should be more descriptive "time"
names(DF) <- sub("^t","time",names(DF))
## Prefix "f" should be more descriptive "frequency"
names(DF) <- sub("^f","frequency",names(DF))
# 5.  From the data set in step 4, creates a second, 
#     independent tidy data set with the average of 
#     each variable for each activity and each subject.
class(DF$subject)
## Convert the "subject" variable to factor
DF$subject <- as.factor(DF$subject)
DF_clean <- group_by(DF, subject, activity.y)
DF_Summary <- summarize_each(DF_clean,funs(mean))
str(DF_Summary)
write.csv(DF_Summary,file = "C:\\Users\\Takuya\\OneDrive\\Desktop\\Study\\202010_JHU_DataScience\\202011_JHU_GettingAndCleaning_Week4\\JHU_GetAndCleanData\\DataSet.csv")
