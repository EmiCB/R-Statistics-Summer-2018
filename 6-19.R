rand.x <- rnorm(50, 10, 4)
rand.x

y <- rand.x + rnorm(50, 0, 2)

model <- lm(y ~ rand.x)
summary(model)

y.hat <- predict(model, rand.x)   #supposed to give error - needs dataframe
y.hat <- predict(model, data.frame(rand.x))
y.hat

#--------------------------------------------------------------------------------

set.seed(2)
x <- rnorm(50, 10, 4)
x2 <- x^2
y <- x2 + rnorm(50, 0, 1)
model2 <- lm(y ~ x)   #Wrong
summary(model2)
yhat <- predict(model2, data.frame(x))
yhat
y
error <- y - yhat
error
library(magrittr)
error %>% .^2 %>% mean() %>% sqrt()

model3 <- lm(y ~ x2)
model3
summary(model3)

yhat2 <- predict(model2, data.frame(x2))
error2 <- y - yhat2
rmse <- error2 %>% .^2 %>% mean() %>% sqrt()

y <- 3 * x + 1.2 * x^2
model4 <- lm(y ~ poly(x, 2, raw = T))
summary(model4)

#--------------------------------------------------------------------------------

set.seed(1)
x1 <- rpois(500, 5)
x2 <- rnorm(500, 10, 1)
x3 <- rbinom(500, 20, .5)
y <- x1 + 2*x2 + 2*x3^2 + rnorm(500, 0, 5)

mydata <- data.frame(y, x1, x2, x3)
dim(mydata)
train <- mydata[1:400,]
test <- mydata[401:500,]
dim(train)
dim(test)
model <- lm(y ~ x1 + x2 + poly(x3, 2, raw=T), data = train)
summary(model)
prediction <- predict(model, test)
error <- test$y - prediction
qqnorm(error)
