# Assignment for Week 4 of Getting and Cleaning Data
November 11, 2020
Takuya Wakayama
## Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
## Motivation
The collected data is processed as follows:
### Obtain
The data for the project is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
### Merge the training and the test data sets
Following data sets are combined:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
### Assess
Dirty or untidy parts are assessed.
### Define and Code
The script ["run_analysis.R"](https://github.com/TWak0816/JHU_GetAndCleanData/blob/main/run_analysis.R) includes codes followed by the findings where in the original data set modification should be made.
### Summarize
The average of each variable for each activity and each subject is calculated and the dataset is [DataSet.csv](https://github.com/TWak0816/JHU_GetAndCleanData/blob/main/DataSet.csv).

The original description of the project is available from [this](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
