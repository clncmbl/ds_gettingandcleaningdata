# run_analysis.R

library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt")

# Create newname features column. Make the first letter uppercase on the "std"
# and "mean" substrings that we will want to keep.  Then, remove the parentheses
# and the hyphens from the names.
features$newname <- gsub("-std\\(", "-Std(", features$V2)
features$newname <- gsub("-mean\\(", "-Mean(", features$newname)
features$newname <- gsub("[(),-]", "", features$newname)

# Identify the columns of X that we want to keep based on the name in features.
keepers <- grep("-std\\(\\)|-mean\\(\\)", features$V2)

# Remove the rows in features corresponding to the X columns that we do not want. 
features <- features[keepers,]

# Load and rbind X files.
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test  <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(X_train, X_test)

# Remove unwanted columns and assign names for the remaining from features.
X <- X[, keepers]
names(X) <- features$newname

# Load, rbind, and name subject column.
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"

# Load, rbind, and name activity column.
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test  <- read.table("UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)
names(y) <- "activity"

# Convert activity column to factor with names (in lower case)
# from activity_labels.txt in the data download.
y$activity <- factor(y$activity,
                     labels=(c("walking",
                               "walkingupstairs",
                               "walkingdownstairs",
                               "sitting",
                               "standing",
                               "laying")))

# cbind the activity, subject, and X data frames.
ysX <- cbind(y, subject, X)

# Create a new data frame with the means of each measurement
# grouped by activity and subject.
by_activity_subject <- ysX %>% group_by(activity, subject)
means <- by_activity_subject %>% summarise_each(funs(mean))

# Write the means data frame to a file.
write.table(means, "gettingandcleaningout.txt", row.names=FALSE)

