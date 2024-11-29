#### Preamble ####
# Purpose: Simulate traffic speed data for pre-analysis and testing purposes.
# Author: Andy Jiang
# Date: 23 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(tibble)
library(readr)

#### Simulate data ####
set.seed(304)

# Number of rows to simulate
n_rows <- 100

# Simulate 100 random traffic speed observations
simulated_speed_data <- tibble(
  # Unique row identifier
  id = seq(1, n_rows),
  
  # Assign random sign IDs (representing different locations)
  sign_id = sample(1:10, n_rows, replace = TRUE),
  
  # Simulate months in the format YYYY-MM
  month = sample(seq(as.Date("2023-01-01"), as.Date("2024-12-01"), by = "months"), 
                 n_rows, replace = TRUE),
  
  # Generate percentile speeds (e.g., normally distributed around a mean)
  pct_05 = round(rnorm(n_rows, mean = 20, sd = 5), 1),
  pct_10 = round(rnorm(n_rows, mean = 25, sd = 5), 1),
  pct_15 = round(rnorm(n_rows, mean = 30, sd = 5), 1),
  pct_20 = round(rnorm(n_rows, mean = 35, sd = 5), 1),
  pct_25 = round(rnorm(n_rows, mean = 40, sd = 5), 1),
  pct_30 = round(rnorm(n_rows, mean = 45, sd = 5), 1),
  pct_35 = round(rnorm(n_rows, mean = 50, sd = 5), 1),
  pct_40 = round(rnorm(n_rows, mean = 55, sd = 5), 1),
  pct_45 = round(rnorm(n_rows, mean = 60, sd = 5), 1),
  pct_50 = round(rnorm(n_rows, mean = 65, sd = 5), 1),
  pct_55 = round(rnorm(n_rows, mean = 70, sd = 5), 1),
  pct_60 = round(rnorm(n_rows, mean = 75, sd = 5), 1),
  pct_65 = round(rnorm(n_rows, mean = 80, sd = 5), 1),
  pct_70 = round(rnorm(n_rows, mean = 85, sd = 5), 1),
  pct_75 = round(rnorm(n_rows, mean = 90, sd = 5), 1),
  pct_80 = round(rnorm(n_rows, mean = 95, sd = 5), 1),
  pct_85 = round(rnorm(n_rows, mean = 100, sd = 5), 1),
  pct_90 = round(rnorm(n_rows, mean = 105, sd = 5), 1),
  pct_95 = round(rnorm(n_rows, mean = 110, sd = 5), 1),
  
  # Generate counts for vehicles in each speed bin
  spd_00 = sample(0:50, n_rows, replace = TRUE),
  spd_05 = sample(0:100, n_rows, replace = TRUE),
  spd_10 = sample(100:300, n_rows, replace = TRUE),
  spd_15 = sample(200:500, n_rows, replace = TRUE),
  spd_20 = sample(100:400, n_rows, replace = TRUE),
  spd_25 = sample(50:200, n_rows, replace = TRUE),
  spd_30 = sample(20:100, n_rows, replace = TRUE),
  spd_35 = sample(10:50, n_rows, replace = TRUE),
  spd_40 = sample(5:20, n_rows, replace = TRUE),
  spd_45 = sample(0:10, n_rows, replace = TRUE),
  spd_50 = sample(0:5, n_rows, replace = TRUE),
  spd_55 = sample(0:2, n_rows, replace = TRUE),
  spd_60 = sample(0:1, n_rows, replace = TRUE),
  spd_65 = sample(0:1, n_rows, replace = TRUE),
  spd_70 = sample(0:1, n_rows, replace = TRUE),
  spd_75 = sample(0:1, n_rows, replace = TRUE),
  spd_80 = sample(0:1, n_rows, replace = TRUE),
  spd_85 = sample(0:1, n_rows, replace = TRUE),
  spd_90 = sample(0:1, n_rows, replace = TRUE),
  spd_95 = sample(0:1, n_rows, replace = TRUE),
  spd_100_and_above = sample(0:1, n_rows, replace = TRUE),
  
  # Total volume of vehicles observed (sum of all speed bins)
  volume = spd_00 + spd_05 + spd_10 + spd_15 + spd_20 + spd_25 +
    spd_30 + spd_35 + spd_40 + spd_45 + spd_50 + spd_55 +
    spd_60 + spd_65 + spd_70 + spd_75 + spd_80 + spd_85 +
    spd_90 + spd_95 + spd_100_and_above
)

#### Write_csv ####
write_csv(simulated_speed_data, file = "data/00-simulated_data/simulated_speed_data.csv")

### Test simulated data ###

# Test 1: Check that all percentiles are in increasing order
test_percentiles <- all(
  simulated_speed_data$pct_05 <= simulated_speed_data$pct_10 &
    simulated_speed_data$pct_10 <= simulated_speed_data$pct_15 &
    simulated_speed_data$pct_15 <= simulated_speed_data$pct_20 &
    simulated_speed_data$pct_20 <= simulated_speed_data$pct_25 &
    simulated_speed_data$pct_25 <= simulated_speed_data$pct_30 &
    simulated_speed_data$pct_30 <= simulated_speed_data$pct_35 &
    simulated_speed_data$pct_35 <= simulated_speed_data$pct_40 &
    simulated_speed_data$pct_40 <= simulated_speed_data$pct_45 &
    simulated_speed_data$pct_45 <= simulated_speed_data$pct_50 &
    simulated_speed_data$pct_50 <= simulated_speed_data$pct_55 &
    simulated_speed_data$pct_55 <= simulated_speed_data$pct_60 &
    simulated_speed_data$pct_60 <= simulated_speed_data$pct_65 &
    simulated_speed_data$pct_65 <= simulated_speed_data$pct_70 &
    simulated_speed_data$pct_70 <= simulated_speed_data$pct_75 &
    simulated_speed_data$pct_75 <= simulated_speed_data$pct_80 &
    simulated_speed_data$pct_80 <= simulated_speed_data$pct_85 &
    simulated_speed_data$pct_85 <= simulated_speed_data$pct_90 &
    simulated_speed_data$pct_90 <= simulated_speed_data$pct_95
)
cat("Test 1 - Percentiles are in increasing order:", test_percentiles, "\n")

# Test 2: Check that the volume matches the sum of all speed bins
test_volume <- all(
  simulated_speed_data$volume ==
    rowSums(simulated_speed_data[, grepl("^spd_", colnames(simulated_speed_data))])
)
cat("Test 2 - Volume matches sum of speed bins:", test_volume, "\n")
