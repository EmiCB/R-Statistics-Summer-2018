mydata <- read.csv("C:/users/emicb/desktop/r-stats/ccpp/Folds5x2_pp.csv")
#View(mydata)

train <- mydata[1:7000,]
test <- mydata[7001:9568,]

na.omit(mydata)

model <- lm(PE ~ 
              poly(AT, 100, raw = T) + 
              poly(V, 100, raw = T) + 
              poly(AP, 100, raw = T) + 
              RH +
              AP * RH * poly(V, 100, raw = T) * AT
            , data = train)

summary(model)
prediction <- predict(model, test)
error <- test$PE - prediction
qqnorm(error)

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse

#------------------------------------------------
model <- lm(PE ~ 
              poly(AT, 1, raw = T) + 
              poly(V, 1, raw = T) + 
              poly(AP, 1, raw = T) + 
              RH +
              AP * RH * V  * AT * 100
            , data = train)

summary(model)
prediction <- predict(model, test)
error <- test$PE - prediction
qqnorm(error)

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse


