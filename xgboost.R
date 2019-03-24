# https://cran.r-project.org/web/packages/xgboost/vignettes/xgboostPresentation.html#dataset-preparation

install.packages("xgboost")
library(xgboost)

data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')

train <- agaricus.train
test <- agaricus.test

test
str(train)

bstSparse <- xgboost(data = train$data, label = train$label, max_depth = 2, eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic")
dtrain <- xgb.DMatrix(data = train$data, label = train$label)

bst <- xgboost(data = dtrain, max_depth = 2, eta = 1, nthread = 2, nrounds = 2, objective = "binary:logistic", verbose = 0)
bst

pred <- predict(bst, test$data)
print(length(pred))
