#### Preamble ####
# Purpose: Perform exploratory data analysis (EDA) on the speed dataset.
# This script generates summary statistics, visualizations, and insights 
# about key variables such as speed percentiles and volume. It also includes 
# correlation analysis and missing value analysis.
# Author: Andy Jiang
# Date: 25 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites:
#   - The cleaned speed dataset must be available at 
#     "data/02-analysis_data/analysis_speed_data.csv".
#   - The GGally library is required for correlation matrix visualization.
#   - Ensure the "data/02-analysis_data/" directory exists to save the summary tables.

#### Workspace setup ####
library(tidyverse)

#### Load Data ####
# Read the cleaned data
analysis_data <- read_csv("data/02-analysis_data/analysis_speed_data.csv")

#### Summary Statistics ####
# Basic summary of the dataset
summary(analysis_data)

# Summary of speed percentiles (pct_05 to pct_95)
speed_summary <- analysis_data %>%
  select(starts_with("pct_")) %>%
  summarise(across(everything(), list(mean = mean, sd = sd, min = min, max = max), na.rm = TRUE))

print("Summary of speed percentiles:")
print(speed_summary)

#### Visualize Relationships ####

# Distribution of speed percentiles
analysis_data %>%
  select(starts_with("pct_")) %>%
  pivot_longer(cols = everything(), names_to = "percentile", values_to = "value") %>%
  ggplot(aes(x = value, fill = percentile)) +
  geom_density(alpha = 0.6) +
  labs(
    title = "Distribution of Speed Percentiles",
    x = "Speed (km/h)",
    y = "Density"
  ) +
  theme_minimal()

# Scatterplot: Volume vs. Mean Speed
analysis_data <- analysis_data %>%
  mutate(
    spd_mean = rowMeans(select(., starts_with("pct_")), na.rm = TRUE)
  )

ggplot(analysis_data, aes(x = volume, y = spd_mean)) +
  geom_point(alpha = 0.5, color = "blue") +
  labs(
    title = "Scatterplot of Volume vs. Mean Speed",
    x = "Volume",
    y = "Mean Speed"
  ) +
  theme_minimal()

# Correlation Matrix for Key Variables
library(GGally)

key_vars <- analysis_data %>%
  select(volume, spd_mean, starts_with("pct_"))

ggpairs(key_vars, title = "Correlation Matrix of Key Variables")

#### Missing Value Analysis ####
# Check for missing values
missing_summary <- analysis_data %>%
  summarise(across(everything(), ~ sum(is.na(.)))) %>%
  pivot_longer(cols = everything(), names_to = "variable", values_to = "missing_count")

print("Missing value summary:")
print(missing_summary)

ggplot(missing_summary, aes(x = variable, y = missing_count)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(
    title = "Missing Values by Variable",
    x = "Variable",
    y = "Missing Count"
  ) +
  theme_minimal()

#### Save Summary Tables ####
# Save the speed summary to a CSV
write_csv(speed_summary, "data/02-analysis_data/eda_speed_summary.csv")
