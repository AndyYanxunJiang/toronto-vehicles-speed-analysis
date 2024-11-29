#### Preamble ####
# Purpose: Clean the raw traffic speed dataset to prepare it for analysis.
# This includes removing unnecessary columns and saving the cleaned data.
# Author: Andy Jiang
# Date: 23 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: 
#   - Raw traffic speed data should be downloaded and available at 
#     "data/01-raw_data/raw_speed_data.csv".
#   - The `tidyverse` package should be installed.

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
