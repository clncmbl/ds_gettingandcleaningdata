CodeBook
========

The output data file consist an activity column, a subject column, and 66 columns of measurements.

activity column
---------------

The value in the activity column for each row indicates the activity performed by the subject when the observations were made that went into calculating the means for that row.

Each entry in the activity column contains one of the following values:

activity |description
------------- | ----------------
walking | subject is walking 
walkingupstairs | subject is walking up some stairs
walkingdownstairs | subject is walking down some stairs
sitting | subject is sitting
standing | subject is standing
laying | subject is lying down

subject column
--------------

The value in the subject column for each row is an integer identifier for the subject who performed the activity when the observations were made that went into calculating the means for that row.

measurement columns (66)
------------------------

The values in each of the 66 measurement columns are arithmetic means of the values in the original X_train and X_test data sets for each activity-subject combination.

All values are between -1 and +1 because the values in the original data sets, as provided, were normalized to that range.

tGravityAcc-XYZ
tGravityAccMag

tBodyAcc-XYZ
tBodyAccMag
fBodyAcc-XYZ
fBodyAccMag

tBodyAccJerk-XYZ
tBodyAccJerkMag
fBodyAccJerk-XYZ
fBodyAccJerkMag

tBodyGyro-XYZ
tBodyGyroMag
fBodyGyro-XYZ
fBodyGyroMag

tBodyGyroJerk-XYZ  (No frequency transformation available.)
tBodyGyroJerkMag
fBodyGyroJerkMag
