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
  x$id <- seq.int(nrow(x));x
}

# washlabels: clean label-names, convert to lowercase, remove blanks
washlabels <- function(labels) {
  lbl <- sapply(labels, tolower, USE.NAMES = FALSE)
  lbl <- sapply(lbl, gsub, pattern = "[?(-()#$! ]", replacement = "", USE.NAMES = FALSE)
  lbl <- sapply(lbl, gsub, pattern = "[,.]", replacement = "-", USE.NAMES = FALSE)
  lbl
}

#############################################################################
# script start / entry point
#############################################################################

# set working directory
# homedir <- "/home/phabi/Desktop/coursera/cleaning data/project"
# setwd(homedir)
datadir <- "data"

# make data directory, if not existing
if (!dir.exists(datadir)) {
  dir.create(datadir)
}

# 1) merge training and test set to create one dataset
# internal function to load and merge data of either train/test set
loadmerge <- function(subjFile, XFile, XLabFile, yFile) {
  # read files into dataframes, apply name 'subject'
  subj <- read.table(file = subjFile, header = FALSE, strip.white = TRUE)
  colnames(subj) <- 'subject'
  # read X and apply colnames from feature file
  X <- read.table(file = XFile, header = FALSE, strip.white = TRUE)
  Xlab <- read.table(file = XLabFile, header = FALSE, strip.white = TRUE)
  colnames(X) <- Xlab[,2]
  y <- read.table(file = yFile, header = FALSE, strip.white = TRUE)
  colnames(y) <- 'activity'
  ?data.frame
  # add 'id' column containing rownum to all dataframes
  subj <- addidcol(subj)
  X <- addidcol(X)
  y <- addidcol(y)
  # now merge them into one dataframe
  dfList <- list(subj, X, y)
  all <- join_all(dfList, "id")
  all
}

train <- loadmerge(
  "./UCI HAR Dataset/train/subject_train.txt",
  "./UCI HAR Dataset/train/X_train.txt",
  "./UCI HAR Dataset/features.txt",
  "./UCI HAR Dataset/train/y_train.txt"
)

test <- loadmerge(
  "./UCI HAR Dataset/test/subject_test.txt",
  "./UCI HAR Dataset/test/X_test.txt",
  "./UCI HAR Dataset/features.txt",
  "./UCI HAR Dataset/test/y_test.txt"
)

# append training- and testdata
alldata <- rbind(train, test)
# free memory
rm(train, test)

# 2) Extract only the measurements on the mean and standard deviation for each measurement.
# construct column-selection vector:
# select only variables containing mean, std, and keep activity & subject
colsel <- grep("mean|std|activity|subj", colnames(alldata), value = TRUE)
# now build new reduced dataset with the column-selection 
alldata <- alldata[,colsel]

# 3) Use descriptive activity names to name the activities in the data set
alldata$activity <- factor(alldata$activity)
# remap values
library(plyr)
alldata$activity <- mapvalues(alldata$activity, from = c("1", "2", "3", "4", "5", "6"),
                            to = c("WALKING", "WALKING_UPSTAIRS", 
                                   "WALKING_DOWNSTAIRS", "SITTING", 
                                   "STANDING", "LAYING"))

# 4) Appropriately labels the data set with descriptive variable names
names(alldata) <- washlabels(names(alldata))

# 5) From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
library(dplyr)
# now calculate mean on every variable, grouped by subject / activity
newdat <- alldata %>% group_by(subject, activity) %>% summarize_each(funs(mean))
# nicely rename the columns to add 'avg'-prefix
colnames(newdat)[3:81] <- paste0('avg-',colnames(newdat))[3:81]
# write alldata
write.table(newdat, file = paste0(datadir, "/tidy_data_set.txt"), row.names = FALSE, col.names = TRUE)
