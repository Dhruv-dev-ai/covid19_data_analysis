# COVID-19 Comparative Public Health Analysis
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![R](https://img.shields.io/badge/Built%20with-R-blue?logo=R)
![Status](https://img.shields.io/badge/Project-Complete-brightgreen)


## Objective
This project explores how COVID-19 impacted different countries by comparing infection rates, death rates, and vaccination coverage using R. Focus countries: India, USA, Brazil, and Germany.

## Highlights
-  Time-series trends of new cases and deaths per million.
-  Case Fatality Rate comparison across countries.
-  Visual correlation between vaccination coverage and death reduction.

## Tools Used
- R (ggplot2, dplyr, lubridate)
- Dataset: [Our World in Data – COVID-19 Dataset](https://github.com/owid/covid-19-data/blob/master/public/data/owid-covid-data.csv)

## Key Insights
- The USA and Brazil had higher early peaks, while India's peak lagged.
  
- The CFR rates in brazil had severe changes and it was quite high when compared to others
  
- Vaccination rates inversely correlated with death rates across countries.
  
- Germany consistently recorded a higher number of new COVID-19 cases (7-day average per million)** compared to India, the United States, and Brazil during major peaks. This indicates a higher rate of detection, widespread testing, or possibly more widespread community transmission.
  
- The United States showed a steady and sustained rise in cumulative COVID-19 deaths per million**, highlighting prolonged mortality impact over time. The curve was steeper during the initial waves and plateaued later, suggesting improved public health interventions or vaccination efforts.
  
- Brazil experienced sharp fluctuations in new cases and deaths, possibly reflecting inconsistent policy enforcement, public behavior, or data reporting delays.
  
- India showed comparatively lower per-million values in early phases, but sharp surges were observed during major waves (e.g., Delta wave), pointing toward underreporting or low testing early on.

  *Although vaccination-related metrics were limited in this dataset subset, trends in case and death patterns offer critical epidemiological clues.*

## To Run

1. Download the dataset:  
   [owid-covid-data.csv](https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv)

2. Open `covid19_analysis.R` in RStudio.

3. Set the working directory appropriately and run the script to generate visualizations and analysis.
