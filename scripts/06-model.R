# Load libraries
library(rstanarm)
library(tidyverse)

# Load the data
analysis_data <- read_csv("data/02-analysis_data/analysis_speed_data.csv")

# Step 1: Create a new response variable (spd_mean) if not already present
# If 'spd_mean' does not exist, calculate it
analysis_data <- analysis_data %>%
  mutate(
    spd_mean = rowMeans(select(., starts_with("pct_")), na.rm = TRUE)
  )

# Step 2: Filter data to remove rows with missing values
filtered_data <- analysis_data %>%
  filter(
    !is.na(spd_mean),  # Ensure the response variable has no missing values
    !is.na(volume),    # Ensure predictors have no missing values
    !is.na(pct_05),    # Include pct_05
    !is.na(pct_50),
    !is.na(pct_95)
  )

# Step 3: Fit the Bayesian linear regression model
mean_speed_model <- stan_glm(
  formula = spd_mean ~ volume + pct_05 + pct_50 + pct_95,
  data = filtered_data,
  family = gaussian(),
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
  prior_aux = exponential(rate = 1, autoscale = TRUE),
  seed = 123,
  iter = 2000,
  chains = 4,
  control = list(adapt_delta = 0.9)  # Adjust for convergence
)

# Step 4: Save the model
saveRDS(
  mean_speed_model,
  file = "models/speed_model.rds"
)

# Step 5: Add predicted values to the filtered dataset
filtered_data <- filtered_data %>%
  mutate(
    predicted = predict(mean_speed_model, newdata = filtered_data)
  )

# Step 6: Plot Actual vs Predicted Mean Speeds
ggplot(filtered_data, aes(x = predicted, y = spd_mean)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_abline(slope = 1, intercept = 0, color = "red", linetype = "dashed") +
  labs(
    title = "Actual vs Predicted Mean Speeds (Using `pct_05`, `pct_50`, and `pct_95`)",
    x = "Predicted Mean Speeds",
    y = "Actual Mean Speeds"
  ) +
  theme_minimal()
