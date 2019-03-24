library(magrittr)

mydata <- read.csv("C:/users/emicb/desktop/r-stats/mydata.txt")
View(mydata)

#cleaning
mydata2 <- mydata[,-1]
View(mydata2)

#plotting
plot(mydata2)

#HINTS:
#x1 - rp, lambda 5
#x2 - rn, (10, 1)
#x3 - Binom(20, 5)

#---------- NO CHANGE >:( -----------
#variables
y <- mydata2$y
x1 <- mydata2$x1
x2 <- mydata2$x2
x3 <- mydata2$x3

#more cleaning
logy <- log(y)
hist(logy)

#math
model <- lm(logy ~ x1 + x2 + x3)
yhat <- predict(model, data.frame(x1 + x2 + x3))
error <- logy - yhat

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse
#--------------------------------------

#variables
y <- mydata2$y
x1 <- mydata2$x1
x2 <- mydata2$x2
x3 <- mydata2$x3

#more cleaning
logy <- log(y)
hist(logy)

#math
model <- lm(logy ~ x1 + poly(x2, 2, raw=T) + x3)
yhat <- predict(model, data.frame(x1 + x2 + x3))
error <- logy - yhat

hist(error)

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse

