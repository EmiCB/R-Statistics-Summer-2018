install.packages("gbm")

require(xgboost)
require(gbm)

data <- read.csv("C:/users/emicb/desktop/r-stats/627data.txt", sep=",")
data[,-1]

plot(data)

train <- data[0:800,]
test <- data[801:1001,]

model <- gbm(y ~ sin(x), data = train)
plot(model)