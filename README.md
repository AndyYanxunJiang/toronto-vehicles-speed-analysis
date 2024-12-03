# Analyzing Toronto Traffic Speeds: Insights into Patterns and Predictive Modeling

## Overview

This paper investigates traffic speed data from Toronto collected between 2017 and 2024, focusing on trends in speed percentiles and their relationship to traffic volume. Using a Bayesian linear regression model, we predict mean vehicle speeds based on key predictors such as 5th, 50th, and 95th percentile speeds and total traffic volume. Results highlight significant changes in traffic patterns post-2020, with increased extreme speeds linked to higher traffic volumes. This study provides insights into urban mobility dynamics, offering a basis for traffic management strategies and policy-making.


## File Structure

The repo is structured as:

-   `data/00-simulated_data` contains the simulated dataset.
-   `data/01-raw_data` contains the raw data obtained from Open Data Toronto.
-   `data/02-analysis_data` contains the cleaned dataset used for analysis and an EDA summary
-   `model` contains the saved Bayesian linear regression model.
-   `other/datasheet` contains the datasheet documenting the dataset, including a Quarto source file and a PDF output file.
-   `other/llm_usage` contains documentation of language model usage.
-   `other/sketches` contains preliminary sketches and exploratory visuals.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains R scripts for data simulation, downloading, cleaning, testing, exploratory analysis, and model building.


## Statement on LLM usage

ChatGPT, specifically GPT-4o and o1-preview was used to assist in the development of this paper. The LLM was utilized for support across different aspects of the project, such as data cleaning, data testing, data visualization, model building, and writing the paper. The entire chat history can be found in `other/llm_usage/usage.txt`.