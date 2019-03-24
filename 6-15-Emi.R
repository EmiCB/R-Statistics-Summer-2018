#ANSWERS
#
#1.
# a. 32 x 11
# b. ?mtcars
# c. Rear axel ratio
# d. boolean
#2.
# a. geometric
# b. ~1%
# c. ~56%
# d. chisq
# e.
#3. B. Normal, it's continuous while the others are discrete. ___
#4. The probability of getting your H0 value if it's true
#5. The CTL theorem basically saya that if you take the means of any distributon,
#   it will be normal
#6.
# a. H0: mu = 70, Ha: mu != 70
# b. The mean: 70.625
# c. ~0.66
# d. Reject, students need a bigger cushion
#7.
# a. H0: mu = 7.17, Ha: mu != 7.17
# b. 
# c. 
# d. 
#8. 
# a. It provides the amount of daily observations
# b. Date, Daily.Max.8.hour.CO.Concentration, Daily AQI value, Daily obs count
# c. full join  ?
# d. mergeddata <- full_join(codata, no2data)
# e. bubble plot, color based on type, x = date, y = # of observations, size = daily aqi,
#    opacity = concentration
# f. I dont know, probably not


data(mtcars)
View(mtcars)
dim(mtcars)

dgeom(40, 0.02)
pgeom(40, 0.02)

times <- c(78.8, 68.7, 66.4, 73.3, 70.8, 71.7, 64.2, 69.5, 73.5, 72.1, 66.8, 71.7)
mean(times)

a <- 70
sd <- 5
n <- 12
xbar <- 70.625
p <- (xbar-a)/(sd/sqrt(n))
2*pnorm(-abs(p))

screentime <- c(9, 8.75, 7.5, 6.75, 6, 5)
mean(screentime)

a2 <- ""
sd2 <- ""
n2 <- 6
xba2r <- 7.17
p2 <- (xbar2-a2)/(sd2/sqrt(n2))
2*pnorm(-abs(p2))

#8
library(dplyr)
library(lubridate)
library(ggplot2)

codata <- read.csv("C:/users/emicb/desktop/r-stats/codata.csv")
no2data <- read.csv("C:/users/emicb/desktop/r-stats/no2data.csv")

mergeddata <- full_join(codata, no2data)

#Time series 1
plot <- ggplot(mergeddata, aes(Date, DAILY_OBS_COUNT)) + geom_point(color="red") +
   xlab("") + ylab("Daily Observations")
windows():plot(plot)
#color=mergeddata$AQS_PARAMETER_DESC makes it plot nothing :(

#TS 2
plot2 <- ggplot() + 
  geom_line(data = codata, aes(x = Date, y = DAILY_OBS_COUNT), color = "red") +
  geom_line(data = no2data, aes(x = Date, y = DAILY_OBS_COUNT), color = "blue") +
  xlab('Date') +
  ylab('Daily Observations')
windows():plot(plot2)





