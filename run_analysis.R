
# get the ZIP data into a temporary file

filename <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(filename, temp, method="curl")

#define a function to load the different files in an uniform way
loc <- function(prefix, type) {
  filename <- paste(prefix,"_",type,".txt", sep="")
  file <- paste("UCI HAR Dataset", type , filename, sep="/")
  read.csv(unz(temp, file))
}

## load the data
x_test <- loc("X", "test")
y_test <- loc("y", "test")
subject_test <- loc("subject","test")

x_train  <- loc("X", "train")
y_train <- loc("y", "train")
subject_train <- loc("subject","train")

# Objective #1 union the train and test datasets
x <- union(x_test, x_train)
y <- union(y_test, y_train)
subject <- union(subject_test, subject_train)


## use plyr for the rename operations
library(plyr)




