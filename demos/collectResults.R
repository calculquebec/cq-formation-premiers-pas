##################################
# R source code file for gathering simulation results into one dataset
# Created: July 27, 2019
# Updated: July 29, 2019
# Notes: 
# This script is to be used only once mclapplyExample2.sh has been executed
# Assumes results are stored in a directory called results. 
# Change the path argument in list.files function accordingly
##################################

# To read in all the results and combine into 1 data.frame ----------------

# list all files starting with the word scenario in the results directory
# include the full path 
files <- base::list.files(path = "results", 
                          pattern = "scenario",
                          full.names = TRUE)

# read in all the results into a list
resultsList <- base::lapply(files, utils::read.table)


# combine results into a single data.frame
resultsDF <- base::do.call(base::rbind, resultsList)
colnames(resultsDF) <- c("scenario","replicate", "sampleSize", "noiseSD", "b0", "bx", "bz")
resultsDF
