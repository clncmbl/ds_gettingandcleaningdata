# run_analysis.R

library(dplyr)

# Load the data sets that we need to work with.
features <- read.table("UCI HAR Dataset/features.txt")
X_train  <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test   <- read.table("UCI HAR Dataset/test/X_test.txt")
y_train  <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test   <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")

# ============================================
# This section of code corresponds roughly to task #1 listed in the requirements for the script.
# "1. Merges the training and the test sets to create one data set."
# It does not perform the cbind of y, subject, and X, however, because it is more straightforward
# to clean up the X columns before doing that.

# rbind X, y, and subject files.
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# =========================================
# This section of code corresponds to task #2 listed in the requirements for the script.
# "2. Extracts only the measurements on the mean and standard deviation for each measurement."
# Identify the columns of X that we want to keep based on the names in features.
# We want only those columns that are themselves mean or standard deviations.  We
# do not include all columns with those "mean" or "std" because some are the result
# of functions that happen to include means or standard deviations.
keepers <- grep("-std\\(\\)|-mean\\(\\)", features$V2)

# Remove the rows in features corresponding to the X columns that we do not want. 
features <- features[keepers,]

# Remove unwanted columns from X.
X <- X[, keepers]

# =======================================
# This section of code corresponds to task #3 listed in the requirements for the script.
# "3. Uses descriptive activity names to name the activities in the data set."
# Convert activity column to factor with names (in lower case)
# from activity_labels.txt in the data download.
y[,1] <- factor(y[,1],
                labels=(c("walking",
                          "walkingupstairs",
                          "walkingdownstairs",
                          "sitting",
                          "standing",
                          "laying")))

# ===========================================
# This section of code corresponds to task #4 listed in the requirements for the script.
# "4. Appropriately labels the data set with descriptive variable names."

# Rename the single columns in the subject and activity (y) data frames.
names(subject) <- "subject"
names(y)       <- "activity"

# We next adjust the column names in the features data frame
# and put them in a new column for later use in setting the column names of
# the output data frame.

# Create newname features column. Make the first letter uppercase on the "std"
# and "mean" substrings that we will want to keep.  Then, remove the parentheses
# and the hyphens from the names.
features$newname <- gsub("-std\\(", "-Std(", features$V2)
features$newname <- gsub("-mean\\(", "-Mean(", features$newname)
features$newname <- gsub("[(),-]", "", features$newname)

# Replace "BodyBody" with "Body".  The "BodyBody" names appear only in the names
# for frequency-transformed columns and they should match the time-based columns.
# No meaning is provided in the documentation for "BodyBody", which makes it more
# likely that this was a mistake in processing.
features$newname <- gsub("BodyBody", "Body", features$newname)

# Change "MagMean" and "MagStd" to "MeanMag" and "StdMag" to make the order of the
# name parts consistent with the axis-specific names (e.g., "MeanX").
features$newname <- gsub("MagMean", "MeanMag", features$newname)
features$newname <- gsub("MagStd" , "StdMag" , features$newname)

# Now that our names for X are ready in features$newname, we can apply
# those names to the X data frame.
names(X) <- features$newname

# =======================================================
# In this short section of code, we finish up task #1 by combining
# the activity (y), subject, and X data frames into one data frame.

ysX <- cbind(y, subject, X)

# ================================================
# This section of code corresponds to task #5 listed in the requirements for the script.
# "5. From the data set in step 4, creates a second, independent tidy data set with the
#     average of each variable for each activity and each subject."

# Using functions from the dplyr package, we create a new data frame with the means of
# each measurement grouped by activity and subject.
by_activity_subject <- ysX %>% group_by(activity, subject)
means <- by_activity_subject %>% summarise_each(funs(mean))

# =====================================================================
# This section of code writes the data frame to a file for the assignment upload.

write.table(means, "gettingandcleaningout.txt", row.names=FALSE)

