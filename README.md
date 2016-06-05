# Coursera Getting-And-Cleaning Data Project
This project is related to the Coursera Course for the specialization in Data Science at Hopkins University and is the final assignment within the 3rd course 'Getting-And-Cleaning Data' out of ten to achieve the Data Science specialization. See the file project_requirements.md to get the original description of requirements related to this project.

## Purpose of this README.md
The purpose of this README.md is to explain how all of the scripts work and how they are connected.

## File-Descriptions
This section provides the description of the files within this repo.

### The R-Script 'run_analysis.R'
The script assumes, that the zip-content of the link provided at the bottom of this file has been decompressed and the 'UCI HAR Dataset' Folder is present in the working directory. The script reads then performs the following steps as required. It:

1.  Merges the training and the test sets to create one data set.
1.  Extracts only the measurements on the mean and standard deviation for each measurement.
1.  Uses descriptive activity names to name the activities in the data set
1.  Appropriately labels the data set with descriptive variable names.
1.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Finally, the resulting tidy dataset is stored in the 'data'-folder within a text-file named 'tidy_data_set.txt'. You can find more detailled documentation on how these steps are performed from the code-source.

### The 'data'-Folder
The folder containing the final tidy data set named 'tidy_data_set.txt' produced by the 'run_analysis.R' - script, based on the above mentioned steps 1 through 5.

### The 'UCI HAR Dataset'-Folder
This is the data this project is based on. It is publicly available using the 3rd URL provided beneath.

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
