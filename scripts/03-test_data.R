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

library('tidyverse')
library('janitor')
library('dplyr')
#### Test data ####
data <- 
  readr :: read_csv("intputs/data/cleaned_data.csv")


# Test One : Check for NA values in the data frame.

sum(is.na(data))

# Test Two : Check for NA values in specific variables.

# Explanation :  Three are 37060 missing values in the work_status, in addition; there are 4678 missing values in the happy variable,also there are 15454 missing values in the job_satisfied variable.

sum(is.na(data$work_status))   
sum(is.na(data$happy))    
sum(is.na(data$job_satisfied))  

# Test Three: The variable range test.

# Explanation : As the below shows, the range of the year is from 1972 to the year of 2012. In addition; the age range is from 18 to 88 age years old. 

range(data$year)
range(data$age)

# Test Four : The unique variable test of age.

# Explanation : AS the result,which shows the unique age from data.

unique(data$age)

# Test Five : The unique variable test of gender. 

# Explanation : As the result, which shows the unique gender, which are 'female' and 'male'. 

unique(data$sex)
