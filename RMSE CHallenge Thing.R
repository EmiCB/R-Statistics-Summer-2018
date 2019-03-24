install.packages("xlsx")
library(xlsx)
library(dplyr)
library(ISLR)
concrete <- read.xlsx("C:/users/emicb/desktop/r-stats/Concrete_Data.xls", sheetName = "Sheet1")
#View(concrete2)

#windows();plot(concrete)

#Stuff
names(concrete) = c("Cement", "Blast.furnace", "Fly.ash", "Water", "Superplasticizer", "Coarse.agg", "Fine.agg", "Age", "Strength")
concrete2 <- select(concrete, c(Cement, Water, Age, Strength, Superplasticizer, Fine.agg, Coarse.agg, Fly.ash, Blast.furnace))

#Same test set
set.seed(1)
testrows <- sample(1:nrow(concrete2), 200)
train <- concrete2[-testrows,]
test <- concrete[testrows,]

#Stuff
model <- glm(Strength ~ poly(Water,4,raw=T) + 
                        poly(Cement,1,raw=T) +
                        poly(Age,4,raw=T) +
                        poly(Superplasticizer,2,raw=T) +
                        poly(Fine.agg,5,raw=T) +
                        poly(Coarse.agg,1,raw=T) +
                        poly(Fly.ash,2,raw=T) +
                        poly(Blast.furnace,4,raw=T) +
                        sqrt(Water) +
                        sqrt(Age) +
                        sqrt(Cement) 
                        , family=gaussian(link = "identity"), data=train)

summary(model)

prediction <- predict(model, test)
error <- test$Strength - prediction
qqnorm(error)

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse

write.csv(prediction, "Predictions.csv")

