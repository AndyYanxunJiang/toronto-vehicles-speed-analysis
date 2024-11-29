#### Preamble ####
# Purpose: Validates the structure and integrity of the analysis speed dataset.
# This script includes tests to verify dataset dimensions, column contents, 
# and expected properties of specific variables such as speed percentiles.
# Author: Andy Jiang
# Date: 25 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: 
#   - The cleaned speed dataset should be available at 
#     "../data/02-analysis_data/analysis_speed_data.csv".
#   - The `testthat` and `tidyverse` packages should be installed.

#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("../data/02-analysis_data/analysis_speed_data.csv")

#### Test data ####

# Test that the dataset has 32000 rows (as expected from raw data summary)
test_that("dataset has 32000 rows", {
  expect_equal(nrow(data), 32000)
})

# Test that the dataset has 44 columns (since '_id' was removed from 45 original columns)
test_that("dataset has 44 columns", {
  expect_equal(ncol(data), 44)
})

# Test that the `month` column contains valid dates
test_that("'month' column contains valid dates", {
  expect_true(all(!is.na(as.Date(data$month, format = "%Y-%m-%d"))))
})

# Test that all percentile columns (`pct_05` to `pct_95`) are in increasing order
percentile_columns <- data %>%
  select(starts_with("pct_"))

test_that("percentiles are in increasing order", {
  expect_true(all(apply(percentile_columns, 1, function(row) all(diff(row) >= 0))))
})

#### End of Tests ####
