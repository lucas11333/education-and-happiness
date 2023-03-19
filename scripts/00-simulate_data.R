#### Preamble ####
# Purpose:The code above simulates a data set called "happiness_and_income" with information on individuals' happiness, income, and other characteristics. 
#The "set.seed" function sets a specific seed for the random number generator, ensuring that the same random values are generated each time the code is run.
#The "size_of_population" variable sets the number of individuals in the simulated population.The "tibble" function creates a table with columns for the year of observation, 
#age, sex, education level ("degree"), job satisfaction ("job_satisfied"), happiness level ("happy"), satisfaction level ("sat"), and age group ("age2").The "sample" function generates 
#random samples for each of these variables, with the "replace" argument set to TRUE so that each individual can be sampled more than once.The "mutate" function creates a new column for 
#age group based on the age variable, with individuals grouped into "age 18-39", "age 40-59", or "age 60+" based on their age.Overall, this code is simulating a population of individuals 
#with varying characteristics, including their level of happiness, income, and education, among other variables. This type of simulation could be used to explore relationships between 
#these variables and test different hypotheses.
# Author: SHAOHAN CHANG  
# Data: 14 March 2023 
# Contact: SHAOHAN.CHANG@Toronto.ca
# License: MIT
# Pre-requisites: You have downloaded the data from the library. To do that:
  ## 1. Go the website : https://gss.norc.org/get-the-data/stata
  ## 2.Download the all file from 1972 to the 2012 file. 
  ## 3. Click the file of download.
  ## 4. select the SATA file 
  ## 5. Can select all variables by clicking button next to the green colored 'ALL'. Then continue 
  ## 6. Create the file, download and save the file. 
# Any other information needed? 
  ## 1. It is important to note the location where the downloaded data file is saved on your computer, as this will be needed when reading the data into R.
  ## 2. The downloaded data file is likely to be very large, as it contains survey data from 1972 to 2012. It may be necessary to filter the data to a specific 
        # time period or subset of variables in order to work with it more efficiently.
  ## 3. The downloaded data file is likely to be in STATA format, so it will need to be read into R using a package like "haven" or "foreign".
  ## 4. It is also important to familiarize oneself with the code book or documentation for the data set, which can be found on the GSS website or in the downloaded file. 
        # This will provide information on the variables and their meanings, as well as any codes or missing values used in the data set.
  ## 5. Depending on the research question, it may also be necessary to merge the GSS data with other data sets or sources of information to obtain additional variables or contextual information.
#### Work space setup ####

library(tidyverse)


#### Simulate data ####
set.seed(853)

size_of_population <- 1000000

happiness_and_income <-
  tibble(
    year = sample(
      x = c(1970:2000),
      size = size_of_population,
      replace = TRUE
    ),
    age = sample(
      x = c(18:99),
      size = size_of_population,
      replace = TRUE
    ),
    sex = sample(
      x = c("male", "female"),
      size = size_of_population,
      replace = TRUE
    ),
    degree = sample(
      x = c("less_than_high_school", "high_school", "bachelor", "master", "doctoral"),
      size = size_of_population,
      replace = TRUE
    ),
    job_satisfied = sample(
      x = c("other", "moderately satisfied", "very satisfied"),
      size = size_of_population,
      replace = TRUE
    ),
    happy = sample(
      x = c("not too happy", "pretty happy", "very happy"),
      size = size_of_population,
      replace = TRUE
    ),
    sat = sample(
      x = c("other", "moderately satisfied", "very satisfied"),
      size = size_of_population,
      replace = TRUE
    ),
    age2 = sample(
      x = c("age 18-39", "age 40-59", "age 60+"),
      size = size_of_population,
      replace = TRUE
    )
  ) %>%
  mutate(
    age_group = case_when(
      age < 40 ~ "age 18-39",
      age < 60 ~ "age 40-59",
      TRUE ~ "age 60+"
    )
  )


