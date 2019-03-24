rm(list=ls())

ls()
a <- 3
b <- 8
c <- 8

bad <- "OwO"

rm(bad)

myMatrix <- matrix(NA, nrow=4, ncol=3)
myMatrix[2, 1]  #row, collumn
myMatrix[2,]    #row 2
myMatrix[,2]    #collumn 2

myMatrix[,3] <- c(100,20,50,100)

#combining vectors into a matrix
#rbind, cbind
vec1 <- c(1,3,5,8)
vec2 <- c(2,2,3,4)

mat2 <- cbind(vec1, vec2)
mat3 <- rbind(vec1,vec2)

#Make a matrix that displays the probability dist of a binomial n = 20, p = 0.5
makeProbabilityMatrix <- function(start, stop, probability) {
  values <- start:stop
  probs <- dbinom(values, stop, probability)
  data <- cbind(values, probs)
  print(data)
}
makeProbabilityMatrix(0, 20, 0.5) 

#Manual (bc function wont store matrix, will remake)
values <- 0:20
probs <- dbinom(values, 20, 0.5)
data <- cbind(values, probs)
print(data)

#Plotting matrix
library(ggplot2)
data <- data.frame(data)
p <- ggplot(data, aes(x = values, y = probs)) +
  geom_segment(aes(xend = values, yend = 0), size = 5) +
  ylab('P[Values]') +
  xlab('Values')
p
