#### Preamble ####
# Purpose: Download and save traffic speed data from Open Data Toronto.
# Author: Andy Jiang
# Date: 23 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites:
#   - Internet access is required to fetch data from the Open Data Toronto API.
#   - The `opendatatoronto` and `dplyr` libraries should be installed.


#### Workspace setup ####
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("e0a82533-93d5-4f63-81f5-128f8b665200")
package

# get all resources for this package
resources <- list_package_resources("e0a82533-93d5-4f63-81f5-128f8b665200")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()

write.csv(data, "data/01-raw_data/raw_speed_data.csv")