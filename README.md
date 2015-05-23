datasciencecoursera
===================

Projects of the Data Science course in Coursera.

getdataproject
==============

The purpose of this project is to collect, work with, and clean a data set.

To run the project, first clone the repository:

 $ git clone https://github.com/elopio/datasciencecoursera.git

Open the R console:

 $ R

Source the R script:

 > source("run_analysis.R")

The R script will:
1. Install and load the dplyr library.
2. Get the Samsung accelerometers data required for the project.
3. Merge the train and test data sets from the Samsung data directory.
4. Set the column names for the measurements.
5. Merge with the labels of the activities.
6. Extract the columns corresponding to mean and standard deviation of the
   measurements.
7. Group the dataset by activity and subject and calculate the average of each
   group.
8. Save the grouped dataset to "tidy.


Tested in Ubuntu 15.04, with package r-base-core version 3.1.2-2.
