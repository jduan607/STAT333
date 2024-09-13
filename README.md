# Regression Analysis of the Effect of the Percentage of Long Time Commuters on the Adult Obesity Rate
STAT 333 Applied Regression Analysis (Spring 2018) Project

## Background
As the rate of obesity significantly increases over the time, obesity has now become one of the leading public issues in the United States. Not only would obesity and its associated health problems undermine the lengths and quality of lives of individuals, but they also increase the healthcare costs nationwide. Considering these severe consequences of obesity, our group was interested in identifying a potential factor behind the high obesity rate in the United States.

<img width="480" alt="commuting" src="https://github.com/user-attachments/assets/f4e3ecea-7da3-44ed-a750-82aeff813061">

<img width="416" alt="obesity" src="https://github.com/user-attachments/assets/edea7e3d-4800-488c-a2cd-46c60c0d3814">



## Statistical Technique
+ Multiple linear regression
+ Random forests

## Result
As we examined the relationship between the percentage of long-time commuters (commuting time > 30 min) (X) and the adult obesity rate (Y), we have found several potential confounders that might influence the relationship between X and Y, including disability rate (Z1), poverty rate (Z2) and median household income (Z3), which we thought can both affect the percentage of long-time commuters and the obesity rate. Our group then proposed that counties where more people commuting for a long time tend to have higher obesity rate, after smoothing the percentage of long-time commuters and controlling the disability rate, poverty rate and median household income.


## Data Sources
+ [Long commute data from County Health Rankings & Roadmaps](https://www.countyhealthrankings.org/app/wisconsin/2017/measure/factors/137/description)
+ [Obesity data from Centers for Disease Control and Prevention](https://www.cdc.gov/diabetes/data/index.html)
+ [Disability data from the American Community Survey (ACS)](http://rtc.ruralinstitute.umt.edu/geography/)
+ [Poverty data from Data USA](https://datausa.io/profile/geo/united-states#economy)
+ [Estimates of poverty and income from the Census Bureau](https://www.census.gov/data/datasets/2013/demo/saipe/2013-state-and-county.html)
