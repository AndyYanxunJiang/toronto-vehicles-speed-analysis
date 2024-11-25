#### Preamble ####
# Purpose: Clean the traffic speed raw data
# Author: Andy Jiang
# Date: 23 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: Raw data downloaded

#### Workspace setup ####
library(tidyverse)

#### Load raw speed data ####
raw_data <- read_csv("data/01-raw_data/raw_speed_data.csv")

#### Clean data by removing the '_id' column ####
# Remove '_id' column as it is not needed for analysis
cleaned_data <- raw_data %>%
  select(-`_id`)

#### Save the cleaned data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_speed_data.csv")

#### End of script ####
