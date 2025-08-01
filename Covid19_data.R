# COVID-19 Comparative Data Analysis
# Author: Dhruv Devesan Nambiar
# Date: 01/08/2025
# Description: Analyzes COVID-19 trends (cases, deaths, CFR) for India, US, Brazil, and Germany using OWID data.

# Load packages

library(tidyverse)

#Download only once

url <- "https://raw.githubusercontent.com/owid/covid-19-data/refs/heads/master/public/data/owid-covid-data.csv"
download.file(url, "owid-covid-data.csv")

#Read and filter
covid <- read_csv("owid-covid-data.csv")

#Select only needed countries and select only a few columns for comparison

selected <- covid %>%
  filter(location %in% c("India", "United States", "Brazil", "Germany")) %>%
  select(location, date=as.Date(date), total_cases_per_million, total_deaths_per_million, new_cases_smoothed_per_million, people_fully_vaccinated_per_hundred)


#Save smaller file
write.csv(selected, "covid_filtered.csv", row.names = FALSE)

#Delete the large file
file.remove("owid-covid-data.csv")

##New cases smoothed (per million):

selected %>%
  drop_na(new_cases_smoothed_per_million) %>% 
  ggplot(aes(date,new_cases_smoothed_per_million, color = location, group = location)) +
  geom_line(size=1) +
  labs(title = "New COVID-19 Cases (7-day avg) per Million")+
  xlab("Date")+ylab("New Cases (per million)")+
  theme_bw()

#Saving the plot:
ggsave("New_cases_selected.png")

##Deaths per million comparison:

selected %>% 
  drop_na(total_deaths_per_million) %>% 
ggplot(aes(date, total_deaths_per_million, group = location))+
  geom_point(aes(color = location))+
  geom_smooth(method = lm, se = F)+
  facet_wrap(~location)+
  labs(title = "Cumulative Deaths per Million",
       y = "Deaths per million",
       x = "Date") +
  theme_bw()

#Saving the plot:
ggsave("Deaths_per_million_selected.png")

##Calculating Case Fatality Rate:

cfr_data <- covid %>%
  filter(location %in% c("India", "United States", "Brazil", "Germany")) %>%
  group_by(location) %>%
  summarize(
    latest_cases = max(total_cases, na.rm = TRUE),
    latest_deaths = max(total_deaths, na.rm = TRUE),
    cfr = latest_deaths / latest_cases * 100
  )

#Writing it into a CSV file:

write.csv(cfr_data, "summary_statistics.csv")

##Visualizing the CFR rate vs date for different countries:

selected <- selected %>%
  mutate(cfr = (total_deaths_per_million / total_cases_per_million) * 100)

selected %>%
  filter(cfr>0,
         !is.na(cfr)) %>%
  ggplot(aes(date, cfr, color = location, group = location)) +
  geom_line()+
  facet_wrap(~location)+
  labs(title = "COVID-19 Case Fatality Rate (%) Over Time",
       x = "Date", y = "CFR (%)") +
  theme_bw()

#Saving the plot:
ggsave("CFR_date_selected.png")

#Final message:
message("✅ COVID-19 analysis complete. Plots and summary saved to working directory.")

# To reproduce this script:
# Save 'owid-covid-data.csv' from https://raw.githubusercontent.com/owid/covid-19-data/refs/heads/master/public/data/owid-covid-data.csv
