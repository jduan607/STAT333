rm(list=ls())
library(choroplethr)
library(blscrapeR)
x <- get_bls_county()

data <- read.csv("RAW data.csv", header=T, colClasses="character")
data$obesity.percent <- as.numeric(data$obesity.percent)
data$percent.of.long.time.commuters <- as.numeric(data$percent.of.long.time.commuters) * 100
data$Fips <- 0
data[,c(3,5)] <- data[,c(5,3)]
colnames(data) <- c("State","County","Fips","Commute","Obesity")

##### Fips #####
x <- x[-grep(pattern="PR", x=x$area_title),c(4,10)]
x[550:(nrow(x)+1),] <- x[549:nrow(x),]
x$area_title[549] <- "Kalawao County"; x$fips[549] <- "15005"
x[2918:(nrow(x)+1),] <- x[2917:nrow(x),]
x$area_title[2917] <- "Bedford City"; x$fips[2917] <- "51515"

data[83:(nrow(data)+1),] <- data[82:nrow(data),]
data[82,] <- c("Alaska", "Kusilvak Census Area", 0, NA, NA)
# remove 2004 to 2008 Census 
data <- data[-grep(pattern="2004 to 2008", x=data$County),]
# reomve Wade Hampton Census Area AK (row 94)
data <- data[-grep(pattern="Wade Hampton", x=data$County),]

data$Fips <- x$fips

##### Poverty #####
p <- read.csv("RAW Poverty.csv", header=T)
p <- p[which(p$year == "2013"),]
p$poverty_rate <- p[,4] / p[,5] * 100
p <- p[,c(2,3,6)]

p$geo <- gsub(pattern="05000US", replacement="", x=p$geo)
p <- p[-grep(pattern="^72", x=p$geo),]
p <- p[order(p$geo),]

data$Poverty <- p$poverty_rate

##### Disability #####
d <- read.csv("RAW disability.csv", header=T)
d <- d[-which(d$State == "Puerto Rico"),]
d[2918:(nrow(d)+1),] <- d[2917:nrow(d),]
d$County.Name[2917] <- "Bedford city"; d$Percent.with.a.Disability[2917] <- NA

data$Disability <- d$Percent.with.a.Disability

data$Commute <- as.numeric(data$Commute)
data$Obesity <- as.numeric(data$Obesity)

# write.csv(data, file="data.csv", row.names=F)

df <- data.frame(value=data$Obesity, region=as.numeric(data$Fips))
df2 <- data.frame(value=data$Commute, region=as.numeric(data$Fips))

county_choropleth(df, title="2013 Obesity Prevalence (y: obesity rate)", legend="Obesity Percent")
county_choropleth(df2, title="2013 Long Commute (x: percent of long distance commuters (daily commuting time > 30min))", 
                  legend="Long Commute Percent")

# x: Long Commute Percent
# y: Obesity Percent
# z1: Disability Percent
# z2: Poverty Percent

# Linear Regression model between x and y
lm1 <- lm(Obesity~Commute, data=data)
par(mfrow=c(1,1))
plot(x=data$Commute, y=data$Obesity, pch=20, 
     xlab="Long Commute Percent", ylab="Obesity Percent")
abline(lm1, col="red")
summary(lm1)
par(mfrow=c(2,2))
plot(lm1)

# Linear Regression model between x and z1, z2
lm2 <- lm(Commute~Disability*Poverty, data=data)
summary(lm2)
lm3 <- lm(Commute~Disability+Poverty, data=data)
summary(lm3)
lm4 <- lm(Commute~Disability, data=data)
summary(lm4)
plot(x=data$Disability, y=data$Commute, pch=20)
abline(lm4, col="red")
lm5 <- lm(Commute~Poverty, data=data)
summary(lm5)
plot(x=data$Poverty, y=data$Commute, pch=20)
abline(lm5, col="red")

# Linear Regression model between y and z1, z2
lm6 <- lm(Obesity~Disability*Poverty, data=data)
summary(lm6)
lm7 <- lm(Obesity~Disability+Poverty, data=data)
summary(lm7)
lm8 <- lm(Obesity~Disability, data=data)
summary(lm8)
plot(x=data$Disability, y=data$Obesity, pch=20)
abline(lm8, col="red")
lm9 <- lm(Obesity~Poverty, data=data)
summary(lm9)
plot(x=data$Pov, y=data$Obesity, pch=20)
abline(lm9, col="red")
