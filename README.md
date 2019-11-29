# STAT333 Project
Project for STAT 333: Applied Regression Analysis (Spring 2018) at University of Wisconsin-Madison

## Background
As the rate of obesity significantly increases over the time, obesity has now become one of the leading public issues in the United States. Not only would obesity and its associated health problems undermine the lengths and quality of lives of individuals, but they also increase the healthcare costs nationwide. Considering these severe consequences of obesity, our group was interested in identifying a potential factor behind the high obesity rate in the United States.

## Data Sources
+ https://www.countyhealthrankings.org/app/wisconsin/2017/measure/factors/137/description

## Statistical Technique
+ Multiple linear regression
+ Random forests

## Result
As we examined the relationship between the percentage of long-time commuters (commuting time > 30 min) (X) and the adult obesity rate (Y), we have found several potential confounders that might influence the relationship between X and Y, including disability rate (Z1), poverty rate (Z2) and median household income (Z3), which we thought can both affect the percentage of long-time commuters and the obesity rate. Our group then proposed that counties where more people commuting for a long time tend to have higher obesity rate, after smoothing the percentage of long-time commuters and controlling the disability rate, poverty rate and median household income.
