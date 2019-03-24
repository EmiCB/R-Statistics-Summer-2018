install.packages("Amelia")
library(Amelia)
library(dplyr)

mydata <- read.csv("C:/users/emicb/desktop/r-stats/titanic.txt")

#Cleaning
findNAs <- function(x) {
  sum(is.na(x))
}

sapply(mydata, findNAs)

missmap(mydata)
dim(mydata)

mydata <- select(mydata, c(Survived, Pclass, Sex, Age, SibSp, Parch, Fare, Embarked))
mydata$Age[is.na(mydata$Age)] <- mean(mydata$Age, na.rm = T)

mydata <- mydata[!is.na(mydata$Embarked),]

is.factor(mydata$Sex)
is.factor(mydata$Embarked)

contrasts(mydata$Sex)
contrasts(mydata$Embarked)

#Stuff
train <- mydata[1:800,]
test <- mydata[801:891,]

model <- glm(Survived ~., family=binomial(link="logit"), data=train)

summary(model)

fitted.results <- predict(model, test, type ="response")
fitted.results
fitted.results <- ifelse(fitted.results > 0.5, 1, 0)
fitted.results

accuracy <- mean(fitted.results == test$Survived, na.rm=T)
accuracy

#---

fitted.results <- predict(model,newdata=subset(test,select=c(2,3,4,5,6,7,8)),type='response')
fitted.results <- ifelse(fitted.results > 0.5,1,0)
fitted.results
test$Survived

accuracy <- mean(fitted.results == test$Survived, na.rm=T)
accuracy
