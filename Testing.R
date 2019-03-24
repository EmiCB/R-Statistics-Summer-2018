#---Variables---
#Variables can be set with either an "=" or a "<-"
x = 1
y <- 2

#---Vectors---
vector <- c(1, 2, 5)
age <- c(15, 16, 16, 8, 15, 15, 14, 16, 16, 16, 15, 15, 15, 92)

#c() stands for combine

ev <- vector()  #creates empty vector
ev[1] <- 5
ev[2] <- 4

cv <- character(5)    #creates character vector with length 5
nv <- numeric(5)      #creates numeric vector with length 5
lg <- logical(5)      #creates logical vector with length 5

#---Booleans---
5 == 5
5 < 3
5 > 3
5 <= 3
5 >= 3

#---Random Math IG---
vector*5
vector^2

#---Commands---
mean(age)
sd(age) #standard deviation
#indexing
age[3]
age[3:6] #3 to 6, makes a sequence
age[c(1, 2, 5, 8)] #gives the 1st, 2nd, 5th, and 8th elements
#sequencing
1:100
seq(1,100)
seq(1,100, by = 0.5)

#---Plots---
#plot y = x^2
x <- seq(-5, 5, by=0.1)
y <- x^2
plot(x, y)

#---Matricies---
myMatrix <- matrix(0, nrow = 3, ncol = 5) #Matrix of all 0s

length(age)
ageMatrix <- matrix(age, nrow = 2)

ageMatrix
t(ageMatrix) #transpose
ageMatrix %*% t(ageMatrix) #multiplication

#MORE MATRIX STUFF
mList <- c(2, 0, 0, 2)
aList <- c(5, 2, 3, 2)
m <- matrix(mList, nrow = 2, byrow = T)
a <- matrix(aList, nrow = 2, byrow = T)
m %*% a

det(a) #determinant: ad - bc = 4

#---Probabilities---
choose(n=10, k=3) * (.2^3) * (.8^7) #Binomial solving
exp(-10) * (10^12) / factorial(12)  #Poisson solving

dpios("x","lambda")   #density
dpois(0,3) + dpois(1, 3) + dpois(2,3)
#\/ same as /\
ppois(2,3)

dbinom(3, 20, .1)

#---CLEAR ENV---
rm(list=ls())
#Ctrl+L to clear console

#---STUFF---
y <- 5
class(y)            #says what variable y is
typeof(y)           #says what type of variable y is
y <- as.integer(y)  #casts y to an int

x <- "lol"
class(x)
typeof(x)

z <- "5"
class(z)
typeof(z)
z <- noquote(z)     #gets rid of the quotes
z <- as.integer(z)
z <- as.double(z)

#---Loops & Functions---
condition <- TRUE
if(condition) {
  print("hi")
  condition <- FALSE
} else {
  print("cy@")
}
#ifelse(condition, if event, else event) { } also exists
#%% is remainder (modulo?)

#will automatically create i, still initialize first tho
i = 0 
for(i in 0:5) {
  print(i)
}

temp <- numeric(15)
for(i in 1:length(temp)) {
  temp[i] <- (3*i + 3)
}
temp

#Ctrl + enter or Ctrl + exit to stop a while loop, also there's a red button in the corner
while(i < 5) {
  print(i)
  i <- i+1
}

break

x <- 1
repeat {
  print(x)
  x <- x+1
  if(x == 2019) break
}

#function
func <- function(arg1, arg2) {
  result <- arg1 * arg2
  print(result)
}
func(2, 3)
