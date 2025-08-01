# Load packages
library(tidyverse)

url <- "https://raw.githubusercontent.com/owid/covid-19-data/refs/heads/master/public/data/owid-covid-data.csv"
download.file(url, "data/owid-covid-data.csv")

covid <- read.csv("data/owid-covid-data.csv")

selected <- covid %>%
  filter(location %in% c("India", "United States", "Brazil", "Germany"))

write.csv(selected, "data/covid_filtered.csv", row.names = FALSE)
