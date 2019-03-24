getwd()
cdc <- read.csv("C:/Users/emicb/Desktop/R-Stats/cdc.txt", sep = "") #sep = seperation by quotes
View(cdc)   #shows data in a table
cdc$age     #gives a column

#Histogram - continuous in ranges
#Bar graph - catagorical

hist(cdc$weight)

#height needs to be number of students
sunscreen <- table(cdc$sunscreen, cdc$gender)
barplot(sunscreen, beside = TRUE)

helmet <- table(cdc$helmet, cdc$gender)
barplot(helmet)

height <- table(cdc$height, cdc$gender)
barplot(height, beside = TRUE)

summary(cdc$sunscreen)

str(cdc)
