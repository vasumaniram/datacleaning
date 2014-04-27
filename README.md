datacleaning
============

The repository datacleaning has the following script run_analysis.R( runAnalysis() )which does the following.
* Loads the subject,activity and measurements for test data
* Add the activity description for the activities
* create a testFile with the above data
* Loads the subject,activity and measurements for train data
* Add the activity descrition for the activities
* create a trainFile with the above data
* Read the features file
* merge testFile and trainFile
* create a filteredFile by selecting only the mean(),seq() columns from mergedFile
* create a tidydata.txt by splitting the filteredFile by activity and subject and calculate the mean for the columns
