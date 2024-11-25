#### Preamble ####
# Purpose: Tests the structure and validity of the simulated traffic speed dataset.
# Author: Andy Jiang
# Date: 23 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites:
#   - The `tidyverse` package must be installed and loaded
#   - The simulated speed data must be generated and saved as 'simulated_speed_data.csv'

#### Workspace setup ####
library(tidyverse)

# Load the simulated data
simulated_data <- read_csv("data/00-simulated_data/simulated_speed_data.csv")

# Test if the data was successfully loaded
if (exists("simulated_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Test 1: Check if the dataset has 100 rows
if (nrow(simulated_data) == 100) {
  message("Test Passed: The dataset has 100 rows.")
} else {
  stop("Test Failed: The dataset does not have 100 rows.")
}

# Test 2: Check if the `id` column contains unique values
if (n_distinct(simulated_data$id) == nrow(simulated_data)) {
  message("Test Passed: All values in the 'id' column are unique.")
} else {
  stop("Test Failed: The 'id' column contains duplicate values.")
}

# Test 3: Check if the `sign_id` column contains only integers between 1 and 10
if (all(simulated_data$sign_id %in% 1:10)) {
  message("Test Passed: The 'sign_id' column contains only integers between 1 and 10.")
} else {
  stop("Test Failed: The 'sign_id' column contains invalid values.")
}

# Test 4: Check if the `month` column contains valid dates in the format YYYY-MM
if (all(!is.na(as.Date(simulated_data$month, format = "%Y-%m-%d")))) {
  message("Test Passed: The 'month' column contains valid dates.")
} else {
  stop("Test Failed: The 'month' column contains invalid dates.")
}


# Test 5: Check if the `volume` column matches the sum of all speed bins
speed_bins <- simulated_data %>%
  select(starts_with("spd_"))

test_volume <- all(simulated_data$volume == rowSums(speed_bins))

if (test_volume) {
  message("Test Passed: The 'volume' column matches the sum of all speed bins.")
} else {
  stop("Test Failed: The 'volume' column does not match the sum of all speed bins.")
}

# Test 6: Check if there are no missing values in the dataset
if (all(!is.na(simulated_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Test 7: Check if all values in the speed bins (`spd_00` to `spd_100_and_above`) are non-negative
if (all(unlist(speed_bins) >= 0)) {
  message("Test Passed: All values in the speed bins are non-negative.")
} else {
  stop("Test Failed: Some values in the speed bins are negative.")
}

# Test 8: Check if `volume` values are greater than or equal to the largest speed bin count
if (all(simulated_data$volume >= apply(speed_bins, 1, max))) {
  message("Test Passed: 'Volume' values are greater than or equal to the largest speed bin count in each row.")
} else {
  stop("Test Failed: 'Volume' values are less than the largest speed bin count in some rows.")
}
