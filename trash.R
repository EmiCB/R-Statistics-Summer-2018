library(Amelia)
library(dplyr)

mydata <- read.csv("C:/users/emicb/desktop/r-stats/BooTrain.txt")
View(mydata)
plot(mydata)

#Cleaning
findNAs <- function(x) {
  sum(is.na(x))
}
sapply(mydata, findNAs)
missmap(mydata)

mydata <- mydata[,-1]

mydata <- select(mydata, c(bone_length, rotting_flesh, hair_length, has_soul, type))
dim(mydata)

#Stuff
train2 <- mydata[1:295,]
test2 <- mydata[296:321,]

is.factor(mydata$type)
contrasts(mydata$type)

model <- glm(type ~., family=binomial(link="logit"), data=train2)
summary(model)

fitted.results <- predict(model, test2, type="response")
fitted.results
fitted.results <- ifelse(fitted.results > 0.5, 1, 0)
fitted.results

accuracy <- mean(fitted.results == test2$type, na.rm=T)
accuracy

#----------------------------------------------
bt <- read.csv("C:/Users/emicb/desktop/r-stats/BooTrain2.txt")

getwd()
head(bt)
dim(bt)

b <- function(x){
  sum(is.na(x))
}

sapply(bt,function(x) sum(is.na(x)))

sapply(bt,b)

names(bt)
library(dplyr)
bt <- select(bt, c(hair_length,has_soul,type))

head(bt)


train <- bt[1:295,]
test <- bt[296:321,]

model <- glm(type ~.,family=gaussian(link='identity'),data=train)
summary(model)

fit.logit <- predict(model,test)

fitted.results <- predict(model,test,type='response')
fitted.results

fitted.results <- ifelse(fitted.results > 0.5,1,0)
fitted.results
test$type

accuracy <- mean(fitted.results==test$type,na.rm=T)
accuracy


