# This file is part of datasciencecoursera.

# datasciencecoursera is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# datasciencecoursera is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with datasciencecoursera.  If not, see <http://www.gnu.org/licenses/>.

MergeTrainAndTestSets <- function() {
  # Merges the tran and test data sets from the Samsung data directory.
  #
  # If the data is not present in the working directory, this function
  # downloads and extracts the original data set.
  #
  # Returns:
  #  A data table with the merged data set.
  GetData()
  # Read all the original data sets.
  dataset.dir <- "UCI HAR Dataset"
  activity.labels <- ReadDataTable(dataset.dir, "activity_labels.txt")
  features <- ReadDataTable(dataset.dir, "features.txt")
  test.dataset.dir <- paste(dataset.dir, "test", sep="/")
  test.subjects <- ReadDataTable(test.dataset.dir, "subject_test.txt")
  test.measurements <- ReadDataTable(test.dataset.dir, "X_test.txt")
  test.activities <- ReadDataTable(test.dataset.dir, "y_test.txt")
  train.dataset.dir <- paste(dataset.dir, "train", sep="/")
  train.subjects <- ReadDataTable(train.dataset.dir, "subject_train.txt")
  train.measurements <- ReadDataTable(train.dataset.dir, "X_train.txt")
  train.activities <- ReadDataTable(train.dataset.dir, "y_train.txt")

  # Merge the test data set.
  test.dataset <- cbind(test.subjects, test.activities, test.measurements)
  # Merge the train data set.
  train.dataset <- cbind(train.subjects, train.activities, train.measurements)

  # Join the test and train data sets.
  dataset <- rbind(train.dataset, test.dataset)
}

GetData <- function() {
  # Gets the Samsung accelerometers data required for the project.
  # If the data directory already exists, it does nothing.
  data.dir <- "UCI HAR Dataset"
  if (!file.exists(data.dir)) {
    DownloadAndExtractData()
  }
}

DownloadAndExtractData <- function() {
  # Downloads and extracts the data file required for the project.
  #
  # If the compressed file already exits, it is not downloaded again.
  file.name <- "getdata_projectfiles_UCI HAR Dataset.zip"
  if (!file.exists(file.name)) {
    # Replace special characters for URL encoded symbols.
    # TODO(elopio): find a libary that can escape the file name. curlEscape
    # from the RCurl package fails to escape the underscores.
    escaped.file.name <- "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    file.url <- paste("https://d396qusza40orc.cloudfront.net/",
                      escaped.file.name, sep="")
    download.file(file.url, destfile=file.name, method="curl")
  }
  unzip(file.name)
}

ReadDataTable <- function(directory, file.name) {
  # Reads a data table from a file.
  #
  # Args:
  #   directory: The directory where the file is located.
  #   file.name: The name of the file that contains the data.
  #
  # Returns:
  #   A table with the data read from the file.
  table <- read.table(paste(directory, file.name, sep="/"))
  return(table)
}

data.set <- MergeTrainAndTestSets()