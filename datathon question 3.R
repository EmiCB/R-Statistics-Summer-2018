# ----- Question 3 -----
require(Amelia)
require(neuralnet)
require(rpart)
require(randomForest)
require(xgboost)

train3 <- read.csv("C:/users/emicb/desktop/r-stats/FFtrain.txt", sep=",")
test3 <- read.csv("C:/users/emicb/desktop/r-stats/FFtesthidden.txt", sep=",")

#checking / cleaning
missmap(train3)
missmap(test3)

train3 <- train3[,-1]
test3 <- test3[,-1]

#actual stuff
windows(); plot(train3)

train3.1 <- train3[0:400,]
test3.1 <- train3[401:457,]

#ML model
#It's lowest with just rain :/
rf.model <- randomForest(area ~ rain
                        , ntree=500, data = train3.1, do.trace=T)

prediction <- predict(rf.model, test3.1)
error <- test3.1$area - prediction
look <- data.frame(test3.1$area,prediction)
look
qqnorm(error)

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse

#Other model
model <- lm(area ~ 
                   poly(X,2,raw=T) + 
                   poly(Y,1,raw=T) + 
                   poly(FFMC,1,raw=T) + 
                   poly(DMC,1,raw=T) + 
                   poly(DC,2,raw=T) + 
                   poly(ISI,3,raw=T) + 
                   poly(temp,1,raw=T) + 
                   poly(RH,1,raw=T) + 
                   poly(wind,4,raw=T) + 
                   poly(rain,1,raw=T) +
                   sqrt(rain) +
                   log(DC)
                   , data = train3.1)

prediction <- predict(model, test3.1)
error <- test3.1$area - prediction
qqnorm(error)

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse
# ----- End of 3 -----
