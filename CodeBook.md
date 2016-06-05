# Coursera 'Getting and Cleaning Data'-Project CodeBook

This Codebook describes the tidy dataset created by the 'run_analysis.R' script and stored in the 'data/tidy_data_set.csv' file. 

## Data Source
The data used for this project has been provided here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further information is available here:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This codepage document extends the codepage document contained in the README.txt in the above mentioned zip. 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

License information is provided at the end of this document.

## The Processing Steps
To obtain this Dataset, the following steps have been performed on the Source Data provided above:

1.  Merge the training and the test sets to create one data set.
1.  Extract only the measurements on the mean and standard deviation for each measurement.
1.  Use descriptive activity names to name the activities in the data set
1.  Appropriately label the data set with descriptive variable names.
1.  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

You can find more detailled documentation on how these steps are performed from the source-code in the script 'run_analysis.R'. 

By 'appropriately label' I did the following: The original variable-names have been converted to lowercase, special-characters have been removed and commas(',') or periods('.') have been replaced by a '-'.

## The variables
The tidy dataset is provided in the 'data'-Folder and named 'tidy_data_set.csv'. It contains the following variables:

* subject: An Integer from 1:30 representing the person, wearing the mobile device.
* activity: One of 6 factors representing an activity.
* avg-tbodyacc-mean-x
* avg-tbodyacc-mean-y
* avg-tbodyacc-mean-z
* avg-tbodyacc-std-x
* avg-tbodyacc-std-y
* avg-tbodyacc-std-z
* avg-tgravityacc-mean-x
* avg-tgravityacc-mean-y
* avg-tgravityacc-mean-z
* avg-tgravityacc-std-x
* avg-tgravityacc-std-y
* avg-tgravityacc-std-z
* avg-tbodyaccjerk-mean-x
* avg-tbodyaccjerk-mean-y
* avg-tbodyaccjerk-mean-z
* avg-tbodyaccjerk-std-x
* avg-tbodyaccjerk-std-y
* avg-tbodyaccjerk-std-z
* avg-tbodygyro-mean-x
* avg-tbodygyro-mean-y
* avg-tbodygyro-mean-z
* avg-tbodygyro-std-x
* avg-tbodygyro-std-y
* avg-tbodygyro-std-z
* avg-tbodygyrojerk-mean-x
* avg-tbodygyrojerk-mean-y
* avg-tbodygyrojerk-mean-z
* avg-tbodygyrojerk-std-x
* avg-tbodygyrojerk-std-y
* avg-tbodygyrojerk-std-z
* avg-tbodyaccmag-mean
* avg-tbodyaccmag-std
* avg-tgravityaccmag-mean
* avg-tgravityaccmag-std
* avg-tbodyaccjerkmag-mean
* avg-tbodyaccjerkmag-std
* avg-tbodygyromag-mean
* avg-tbodygyromag-std
* avg-tbodygyrojerkmag-mean
* avg-tbodygyrojerkmag-std
* avg-fbodyacc-mean-x
* avg-fbodyacc-mean-y
* avg-fbodyacc-mean-z
* avg-fbodyacc-std-x
* avg-fbodyacc-std-y
* avg-fbodyacc-std-z
* avg-fbodyacc-meanfreq-x
* avg-fbodyacc-meanfreq-y
* avg-fbodyacc-meanfreq-z
* avg-fbodyaccjerk-mean-x
* avg-fbodyaccjerk-mean-y
* avg-fbodyaccjerk-mean-z
* avg-fbodyaccjerk-std-x
* avg-fbodyaccjerk-std-y
* avg-fbodyaccjerk-std-z
* avg-fbodyaccjerk-meanfreq-x
* avg-fbodyaccjerk-meanfreq-y
* avg-fbodyaccjerk-meanfreq-z
* avg-fbodygyro-mean-x
* avg-fbodygyro-mean-y
* avg-fbodygyro-mean-z
* avg-fbodygyro-std-x
* avg-fbodygyro-std-y
* avg-fbodygyro-std-z
* avg-fbodygyro-meanfreq-x
* avg-fbodygyro-meanfreq-y
* avg-fbodygyro-meanfreq-z
* avg-fbodyaccmag-mean
* avg-fbodyaccmag-std
* avg-fbodyaccmag-meanfreq
* avg-fbodybodyaccjerkmag-mean
* avg-fbodybodyaccjerkmag-std
* avg-fbodybodyaccjerkmag-meanfreq
* avg-fbodybodygyromag-mean
* avg-fbodybodygyromag-std
* avg-fbodybodygyromag-meanfreq
* avg-fbodybodygyrojerkmag-mean
* avg-fbodybodygyrojerkmag-std
* avg-fbodybodygyrojerkmag-meanfreq

Since the values have been aggregated and grouped by subject/activity, the labels have been extended with the 'avg'-prefix to the former original name to express, that the resulting values have been avg'ed.

## The activity Labels
The activity Labels can have one of the following values:

1.  WALKING
1.  WALKING_UPSTAIRS
1.  WALKING_DOWNSTAIRS
1.  SITTING
1.  STANDING
1.  LAYING

## License of the data involved
The use of the data involved in this project requires referencing the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

For further details please refer to the following links:

http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
