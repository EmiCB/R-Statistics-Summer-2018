library(dplyr)

mydata <- read.csv("C:/users/emicb/desktop/r-stats/numbers.txt")
plot(mydata)

X <- mydata[,1]
x <- mydata[,2]
hist(X, x)
#---------------------------------------------------------------------------------------

