This README file describes the processing performed by the run_analysis.R script.  It is part of the course project submission for the "Getting and Cleaning Data" course.

For a description of the original source data and the output data, see the CodeBook.md file included as a part of this project submission.

Prerequisites for running the script
------------------------------------
1. R must be installed with the dplyr package and its dependencies.
2. The original source data must be downloaded and unzipped.  It is available here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. The working directory for R must be set to the directory containing the unzipped data.  That is, the working directory must be set to the directory containing the "UCI HAR Dataset" created when unzipping the source data.

run_analysis.R processing
-------------------------
The script performs the following processing steps in the order listed.

### Loading the data
The run_analysis.R script first loads all the data files required for the various processing steps into data frames.  This includes the training and test data (except for the more raw "Inertial Signals" files) and the features list in features.txt.  (The "Inertial Signals" files are not required because the "X" files contain the required measurement values derived from those signals.)

### Required task: "1. Merges the training and the test sets to create one data set." (partial)
The script creates three new data frames containing rows training data appended with the rows of test data.  The three data frames are X (the measurement values), y (activities), and subject.

### Required task: "2. Extracts only the measurements on the mean and standard deviation for each measurement."
The script identifies the "keeper" columns; that is, those that are mean or standard deviations of the measurements.  It finds those columns by looking in the features data frame for the feature names containing "-mean()" or "-std()".  (Other feature names that contain substrings like "mean" or "std" are not included because are derived from means or standard deviations, but are not, themselves, those kinds of values.)

The rows in the features data frame correspond to columns in the X data frame.  So, the script next remove the non-keeper rows from the features and the non-keeper columns from X.

### Required task: "3. Uses descriptive activity names to name the activities in the data set."
The script converts the numeric column in the y (activities) data frame to a factor with the following labels: "walking", "walkingupstairs", "walkingdownstairs", "sitting", "standing", "laying"

### Required task: "4. Appropriately labels the data set with descriptive variable names."

#### Set column names for subject and y (activity) data frames
The script renames the single columns in the subject and y (activity) data frames to "subject" and "activity", respectively.

#### Create adjusted names for measurement value columns
The script creates a new column ("newnames") in the features data frame containing the original names adjusted as follows:

1. Replaces "mean" and "std" with "Mean" and "Std", respectively.
2. Removes the following characters: "(", ")", "-"
3. Replaces "BodyBody" with "Body".  The former was clearly a typo in naming in several of the original columns.
4. Replaces "MagMean" and "MagStd" with "MeanMag" and "StdMag" to make the name part ordering consistent with the ordering in the X-Y-Z column names.

#### Apply the adjusted names to the columns of the X data frame
The script simply assignes the column names of X to be the values of the newnames column of the features data frame.

### Completion of required task #1
The script completes required task #1 (which was only partially completed, previously), by creating a new data frame containing the columns from all three data frames: y, subject, and X.  The name of this new data frame is "ysX".

### Required task: "5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."
Using functions from the dplyr package (group_by and summarise_each), the script creates a new data frame with the means of each measurement grouped by activity and subject.

### Write the data frame out to a file for uploading as part of the assignment upload.
As required, this step uses the write.table function with row.names=FALSE.  It writes it out to a file named GettingAndCleaningProjectOutput.txt in the working directory.
