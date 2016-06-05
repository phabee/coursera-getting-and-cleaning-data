#############################################################################
# Script name:      run_analysis.R
# Author:           Fabian Leuthold
# E-Mail:           fabian.leuthold@gmail.com
# Date:             June, 4th 2016
# 
# Project:          Getting-And-Cleaning Data Project, Coursera
#
#############################################################################

# This project is related to the Coursera Course for the specialization 
# in Data Science at Hopkins University and is the final assignment 
# within the 3rd course 'Getting-And-Cleaning Data' out of ten to achieve
# the Data Science specialization. See the file project_requirements.md 
# to get the original description of requirements related to this project.

# What does this script do? This script performs the following steps. It:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.

#############################################################################
# functions
#############################################################################
# addidcol: adds a new column called 'id' containing the rownumber
#          to a given dataset (no checks performed, if 'id' already existing)
addidcol <- function(x) {
  # apply rownumber to subject
  x$id <- seq.int(nrow(x))
  x
}

# washlabels: clean label-names, convert to lowercase, remove blanks
washlabels <- function(labels) {
  lbl <- sapply(labels, tolower, USE.NAMES = FALSE)
  lbl <- sapply(lbl, gsub, pattern = "[?(-()#$! ]", replacement = "", USE.NAMES = FALSE)
  lbl <- sapply(lbl, gsub, pattern = "[,.]", replacement = "-", USE.NAMES = FALSE)
  lbl
}

# domerge: merge the three csv's provided by rownum and return a df 
#          with named columns
domerge <- function(subjFile, XFile, XLablesFile, yFile) {
  subj <- read.table(file = subjFile, header = FALSE, strip.white = TRUE)
  # name column
  colnames(subj) <- 'subj'
  # apply rownumber to subject
  subj$id <- seq.int(nrow(subj))
  # read X
  X <- read.table(file = XFile, header = FALSE, strip.white = TRUE)
  # read column names
  lbls <- read.table(file = XLablesFile, header = FALSE, strip.white = TRUE)
  lbls <- lbls[,2]
  lbls <- washlabels(lbls)
  
lbls
  # name columns
  colnames(X) <- lbls
  # apply rownumber to X
  X$id <- seq.int(nrow(X))
  # read y
  y <- read.table(file = yFile, header = FALSE, strip.white = TRUE)
  # name column
  colnames(y) <- 'activity'
  # apply rownumber to y
  y$id <- seq.int(nrow(y))
  # now merge subject and X by rownumber (id)
  tmp <- merge(subj, X, by.x = "id", by.y = "id")
  # now merge tmp and y by rownumber (id)
  tmp <- merge(tmp, y, by.x = "id", by.y = "id")
  # remove first id column, return result
  tmp[,2:ncol(tmp)]  
}

#############################################################################
# script start / entry point
#############################################################################

# set working directory
homedir <- "/home/phabi/Desktop/coursera/cleaning data/project"
datadir <- paste0(homedir, "/data")
setwd(homedir)

# make data directory, if not existing
if (!dir.exists(datadir)) {
  dir.create(datadir)
}

# 1) first step: merge training and test set to create one dataset
train <- domerge("./UCI HAR Dataset/train/subject_train.txt", 
                 "./UCI HAR Dataset/train/X_train.txt", 
                 "./UCI HAR Dataset/features.txt", 
                 "./UCI HAR Dataset/train/y_train.txt")

test <- domerge("./UCI HAR Dataset/test/subject_test.txt", 
                "./UCI HAR Dataset/test/X_test.txt", 
                "./UCI HAR Dataset/features.txt", 
                "./UCI HAR Dataset/test/y_test.txt")

one <- merge(train, test)