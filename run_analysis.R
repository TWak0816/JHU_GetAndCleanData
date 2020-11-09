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

readClipboard()
# 1.  Merges the training and the test sets to create 
#     one data set.
# 2.  Extracts only the measurements on the mean and 
#     standard deviation for each measurement.
# 3.  Uses descriptive activity names to name the 
#     activities in the data set
# 4.  Appropriately labels the data set with descriptive 
#     variable names.
# 5.  From the data set in step 4, creates a second, 
#     independent tidy data set with the average of 
#     each variable for each activity and each subject.