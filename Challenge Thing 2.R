library(dplyr)

mydata <- read.csv("C:/users/emicb/desktop/r-stats/613numbers.txt")
plot(mydata)
class(mydata)

#Cleaning
mydata2 <- mydata[-c(1, 2),]
mydata2 <- mydata2[,-1]
mydata2 <- as.numeric(as.character(mydata2))
mydata2 <- as.integer(mydata2)
mydata2 <- mydata2[!is.na(mydata2)]

hist(mydata2)
mean(mydata2)

#Normal dist, mean 10, sd 29
nx <- seq(-100,200)
ny <- dnorm(nx,mean=10, sd=29)

plot(nx, ny)

#Binomial