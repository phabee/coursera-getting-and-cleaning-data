# About the Coursera Getting-And-Cleaning Data Project
This project is related to the Coursera Course for the specialization in Data Science at Hopkins University and is the final assignment within the 3rd course 'Getting-And-Cleaning Data' out of ten to achieve the Data Science specialization. See the file project_requirements.md to get the original description of requirements related to this project.

## Purpose of this README.md
The purpose of this Readme.md is to explain how all of the scripts work and how they are connected.

## File-Descriptions
This section provides the description of the files within this repo.

### The R-Script 'run_analysis.R'
This is the r-script which takes the data and performs the following steps:

1.  Merges the training and the test sets to create one data set.
1.  Extracts only the measurements on the mean and standard deviation for each measurement.
1.  Uses descriptive activity names to name the activities in the data set
1.  Appropriately labels the data set with descriptive variable names.
1.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### First tidy Data Set 'tidy_data_set_1.csv'
A first tidy data set produced by the 'run_analysis.R' - script, based on the steps 1 through 4.

### Second tidy Data Set 'tidy_data_set_2.csv'
A second, independent tidy data set with the average of each variable for each activity and each subject.

### The Codebook named 'CodeBook.md'
This is the code book that describes the variables, the data, and any transformations or work that were performed to clean up the data. It modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

### This 'README.md' File
A README-File, that explains the analysis files in a clear and understandable manner.

### The File 'project_requirements.md'
The project requirement description being subject to this project.

## License & Reference to Publications
The use of the data involved in this project requires referencing the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

For further details please refer to the following links:
- http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names
- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
