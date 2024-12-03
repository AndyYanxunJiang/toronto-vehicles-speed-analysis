# Analyzing Toronto Traffic Speeds: Insights into Patterns and Predictive Modeling

## Overview

This paper investigates traffic speed data from Toronto collected between 2017 and 2024, focusing on trends in speed percentiles and their relationship to traffic volume. Using a Bayesian linear regression model, we predict mean vehicle speeds based on key predictors such as 5th, 50th, and 95th percentile speeds and total traffic volume. Results highlight significant changes in traffic patterns post-2020, with increased extreme speeds linked to higher traffic volumes. This study provides insights into urban mobility dynamics, offering a basis for traffic management strategies and policy-making.


## File Structure

The repo is structured as:

-   `data/01-raw_data` contains the raw data as obtained from X.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the auto-complete tool, Codriver. The abstract and introduction were written with the help of ChatHorse and the entire chat history is available in inputs/llms/usage.txt.

