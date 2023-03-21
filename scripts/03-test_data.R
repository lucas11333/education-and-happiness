#### Preamble ####
# Purpose: The purpose of these tests is to gain a better understanding of the test data frame and to identify any potential 
#issues that may need to be addressed before conducting any further analysis. The first test checks for any missing values in 
#The data frame, while the second test specifically checks for missing values in three specific variables. The third test calculates. 
#descriptive statistics for the age variable, including the mean, median, standard deviation, and range. The fourth test checks for unique 
#values in each of the variables, while the fifth test calculates the range of the year and age variables. By performing these tests, researchers 
#can identify potential issues such as missing data  and can use this information to make informed decisions about how to clean and analyze the data.
# Author: SHAOHAN CHANG 
# Data: 14 March 2023 
# Contact: SHAOHAN.CHANG@Toronto.ca 
# License: MIT
# Pre-requisites: Before performing these tests on the test data, it is assumed that the data has already been imported into R and is stored as a data frame. It is 
# also assumed that the necessary packages for conducting these tests, such as "dplyr" or "tidy verse", have been installed and loaded in R. Additionally, it is important 
#to have a clear understanding of the research question and objectives, as this will help guide the data analysis and determine which tests are most appropriate. Finally, 
# it is recommended to thoroughly review the cookbook or documentation for the data set, as this will provide important information about the variables, their meanings, and 
# Any coding or missing value conventions used in the data set. By having a clear understanding of these prerequisites, researchers can ensure that their data analysis is
# well-informed and accurate.


#### Workplace setup ####

library(tidyverse)
library(janitor)
library(dplyr)
#### Test data ####

data <- 
  readr::read_csv("inputs/data/cleaned_data.csv")


# Test One : Check for NA values in the data frame.
check_result <- ifelse(sum(is.na(data)) == 57330, "Check passed", "Check failed")
print(check_result)

# Test Two : Check for NA values in work status. 

# Explanation :  Three are 37050 missing values in the work_status. 

check_result <- ifelse(sum(is.na(data$work_status)) == 37050, "Check passed", "Check failed")
print(check_result)

# Test Three : Check for NA values in happy.
# Explanation :There are 4678 missing values in the happy variable. 

check_result <- ifelse(sum(is.na(data$happy)) == 4678, "Check passed", "Check failed")
print(check_result)

# Test Four : Check for NA values in job satisfied. 
# Explanation :There are 15454 missing values in the job_satisfied variable.

check_result <- ifelse(sum(is.na(data$job_satisfied)) == 15454, "Check passed", "Check failed")
print(check_result)

# Test Five : Check for NA values in degree. 
# Explanation :There are 148 missing values in the job_satisfied variable.

check_result <- ifelse(sum(is.na(data$degree)) == 148, "Check passed", "Check failed")
print(check_result)

