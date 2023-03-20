 # Shifting Gender Dynamics: A Longitudinal Study of Education, Employment, and Well-being in the United States from 1972 to 2012

This repository is organized as Follows: 

 1. The inputs for this project include data and literature. The data consists of three files: the original labels and dictionaries of the United States Cross-Sectional Cumulative Data micro data from 1972-2012, and the cleaned data file in CSV format. However, the raw data is not included due to licensing restrictions. The literature includes all peer-reviewed articles cited in the report but excludes websites and restricted license documents.

 2. There are two scripts for cleaning the data. The first script, 01_data_clean, cleans the raw data from the United States GSS 1972-2012 into easily interpretative variables and labels. The second script, 01-download_data, further prepares a cleaned version of the data for the report. This includes selecting variables, renaming levels, eliminating missing observations, and selecting relevant data for the report. The script 02-data_cleaning provides a detailed explanation of the data cleaning process, while 02-test_data performs data detection, such as identifying integers, averages, and NA data.

 3. The final data set used for the report is contained in the output data folder. This folder includes the R markdown and PDF results of the report, a bibliography for citations, and a Text preamble to fix the figures in the report in their respective required sections.

To access the United States Cross-Sectional Cumulative Data from 1972-2012, follow these steps:

1. Go to https://gss.norc.org/get-the-data/stata and access the General Social Survey.

2. Select GSS 1972-2012 Cross-Sectional Cumulative Data and choose a language to access the database of available surveys.

3. Find GSS 1972-2012 Cross-Sectional Cumulative Data, click on "data", and download the three files: CSV data file, STATA data definition, and codebook. Ensure that all variables are selected.

4. Save the downloaded files locally.

