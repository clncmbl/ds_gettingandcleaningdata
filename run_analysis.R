
# run_analysis.R

features <- read.table("UCI HAR Dataset/features.txt")
features$newname <- gsub("[(),-]", "", features$V2)
keepers <- grep("-std\\(\\)|-mean\\(\\)", features$V2)
features <- features[keepers,]

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test  <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(X_train, X_test)
X <- X[, keepers]
names(X) <- features$newname

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test  <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"

y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test  <- read.table("UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)
names(y) <- "activity"
y$activity <- factor(y$activity, labels=(c("walking", "walkingupstairs", "walkingdownstairs", "sitting", "standing", "laying")))


ysX <- cbind(y, subject, X)
