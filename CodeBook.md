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

The values in each of the 66 measurement columns are arithmetic means of the mean and standard deviation values in the original X_train and X_test data sets for each activity-subject combination.  More details on the processing of the downloaded data to obtain the means is available in the README.md file.

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
4. Replaced "MagMean" and "MagStd" with "MeanMag" and "StdMag" to make the name part ordering consistent with the ordering in the X-Y-Z column names.

### Column name parts

1. t or f: "t" values indicate that the values are in the time domain (that is, the domain in which the signals were sampled), whereas "f" indicates values transformed into the frequency domain using a Fast Fourier Transform on the time-domain signals.
2. Body or Gravity: "Gravity" indicates those normalized values of acceleration that reflect the force of gravity.  Otherwise, the values relate to the motion of the instrument (that is, the smart phone on the subject's body).
3. Gyro or Acc: Angular velocity from gyroscope or linear acceleration from accelerometer.
4. Jerk or [nothing]: "Jerk" indicates whether the normalized value comes from the derivative taken with respect to time of the angular velocity or the linear acceleration.
5. Mean or Std: The values in the original X files are means and standard deviations of more raw signal values.  "Mean" indicates a mean, and "Std" indicates a standard deviation.  (This should not be confused with the fact that the measurement values in the output file for this project are all means of those more raw mean and standard deviation values grouped by activity and subject.)
6. X, Y, Z, or Mag: This part of the column name indicates whether the value a component associated with the X, Y, or Z axis, or whether it reflects an overall magnitude ("Mag").  The magnitude values, in this case, come from the Euclidean norm (that is, the square root of the sum of the squares).  Be aware, however, that it is not possible to confirm that using the normalized X, Y, Z, and Mag values.

Additional information on the measurement values is available in the features_info.txt and the README.txt files available in the data download zip file.
