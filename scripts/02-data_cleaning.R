#### Preamble ####
# Purpose: The purpose of this code is to clean and preprocess a dataset called "the_raw_data", which contains information about individuals' demographics, 
#employment status, job satisfaction, and happiness. The code selects relevant variables from the dataset, converts them into factors, and renames them to 
#more understandable names. It also removes any observations with missing or invalid values and filters the data to only include years between 1972 and 2012 
#and individuals under the age of 89. Additionally, the code creates a new variable called "age range" based on the age variable, which categorizes individuals 
#into different age groups. Finally, the cleaned dataset is saved as a CSV file called "cleaned_data.csv" in the "outputs" folder. The cleaned dataset is now ready. 
# to be used for further analysis and modeling.
# Author: SHAOHAN CHANG  
# Data: 14 March 2023 
# Contact: SHAOHAN.CHANG@Toronto.ca 
# License: MIT
# Pre-requisites:
## 1. Go the website: https://gss.norc.org/get-the-data/stata
## 2.Scroll down to the "STATA Data" section and click the "Download the GSS STATA data files" link.
## 3. Select the years you want to download from the list provided. You can select multiple years by holding down the "Ctrl" key on your keyboard while clicking on the years you want.
## 4. Click the "Download Selected Files" button at the bottom of the page. 
## 5. On the next page, select the "STATA" file format.
## 6. Select "ALL" from the drop down menu next to the green "ALL" button to download all variables.
## 7. Click the "Create File" button and wait for the file to be generated.
## 8. Once the file has been created, click the "Download File" button to save the file to your computer.
# Any other information needed? [...UPDATE THIS...]
## 1. Make sure to note the location where the downloaded data file is saved on your computer, as you will need to provide the file path when reading the data into R.
## 2. The GSS data file is likely to be very large, especially if you downloaded the data for multiple years. It may be necessary to filter the data to a specific time period or subset of 
# variables in order to work with it more efficiently. This can be done using functions like subset() or dplyr::select().
## 3. Since the downloaded data file is in STATA format, you will need to use a package like "haven" or "foreign" to read the data into R. For example, you can use the haven::read_dta() 
# function to read a STATA file into R.
## 4. It is important to familiarize yourself with the code book or documentation for the dataset, which can be found on the GSS website or in the downloaded file. This will provide information on
# the variables and their meanings, as well as any codes or missing values used in the dataset. Understanding the code book is crucial for cleaning, manipulating, and analyzing the data.
## 5. Depending on your research question, it may be necessary to merge the GSS data with other data sets or sources of information to obtain additional variables or contextual information. This can 
#be done using functions like dplyr::left_join() or merge().

#### Workplace setup ####

library(haven)
library(janitor)
library(tidyverse)

#### Clean data ####
the_raw_data <-
  haven::read_dta("inputs/data/gss7221_r3b.dta")

data <-
  the_raw_data |>
  select(
    year,
    degree,
    evwork,
    age,
    satjob,
    happy,
    sex,
  )

data <-
  labelled::to_factor(data)

data <- data %>%
  clean_names() %>%
  rename(year = year,
         age = age,
         sex = sex,
         degree = degree,
         work = evwork,
         happy = happy,
         job_satisfied = satjob) 


data <- data %>%
  mutate(year = as.numeric(as.character(year))) %>% 
  filter(year >= 1972 & year <= 2012)

data <- data %>%
  filter(age != "89 or older") %>% 
  mutate(age = as.numeric(as.character(age))) %>% 
  mutate(age_range = case_when(
    age < 20 ~ 'age 1-19',
    age >= 20 & age < 40 ~ 'age 20-39',
    age >= 40 & age < 60 ~ 'age 40-59',
    age >= 60 & age < 80 ~ 'age 60-79',
    age >= 80 & age <= 100 ~ 'age 80-100',
    age > 100 ~ 'age over 100',
    TRUE ~ 'unknown'
  ))


#### Save data ####
write_csv(data, file = "inputs/data/cleaned_data.csv") 

