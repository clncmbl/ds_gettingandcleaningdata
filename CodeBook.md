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

measurement columns (66 columns)
------------------------

The values in each of the 66 measurement columns are arithmetic means of the values in the original X_train and X_test data sets for each activity-subject combination.  More details on the processing of the downloaded data to obtain the means is available in the README.md file.

All values in these 66 columns are between -1 and +1 because the values in the original data sets, as provided, were normalized to that range.  Because they are normalized, the values lack units.

The measurement columns appear in the data set in the following order (reading left to right, first, then down):

 |  |  | 
-------------------- | ------------------ | ------------
tBodyAccMeanX        | tBodyAccMeanY      | tBodyAccMeanZ
tBodyAccStdX         | tBodyAccStdY       | tBodyAccStdZ
tGravityAccMeanX     | tGravityAccMeanY   | tGravityAccMeanZ
tGravityAccStdX      | tGravityAccStdY    | tGravityAccStdZ
tBodyAccJerkMeanX    | tBodyAccJerkMeanY  | tBodyAccJerkMeanZ
tBodyAccJerkStdX     | tBodyAccJerkStdY   | tBodyAccJerkStdZ
tBodyGyroMeanX       | tBodyGyroMeanY     | tBodyGyroMeanZ
tBodyGyroStdX        | tBodyGyroStdY      | tBodyGyroStdZ
tBodyGyroJerkMeanX   | tBodyGyroJerkMeanY | tBodyGyroJerkMeanZ
tBodyGyroJerkStdX    | tBodyGyroJerkStdY  | tBodyGyroJerkStdZ
tBodyAccMeanMag      | tBodyAccStdMag
tGravityAccMeanMag   | tGravityAccStdMag
tBodyAccJerkMeanMag  | tBodyAccJerkStdMag
tBodyGyroMeanMag     | tBodyGyroStdMag
tBodyGyroJerkMeanMag | tBodyGyroJerkStdMag
fBodyAccMeanX        | fBodyAccMeanY     | fBodyAccMeanZ
fBodyAccStdX         | fBodyAccStdY      | fBodyAccStdZ
fBodyAccJerkMeanX    | fBodyAccJerkMeanY | fBodyAccJerkMeanZ
fBodyAccJerkStdX     | fBodyAccJerkStdY  | fBodyAccJerkStdZ
fBodyGyroMeanX       | fBodyGyroMeanY    | fBodyGyroMeanZ
fBodyGyroStdX        | fBodyGyroStdY     | fBodyGyroStdZ
fBodyAccMeanMag      | fBodyAccStdMag
fBodyAccJerkMeanMag  | fBodyAccJerkStdMag
fBodyGyroMeanMag     | fBodyGyroStdMag
fBodyGyroJerkMeanMag | fBodyGyroJerkStdMag

The names of the columns match those of the original data set except for the following adjustments:

1. Replaced "mean" and "std" with "Mean" and "Std", respectively.
2. Removed the following characters: "(", ")", "-"
3. Replaced "BodyBody" with "Body".  The former was clearly a typo in naming in several of the original columns.

### Column name parts

t or f  
Body or Gravity  
Gyro or Acc  
Jerk or [nothing]  
Mean or Std  
X, Y, Z, or Mag  

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
