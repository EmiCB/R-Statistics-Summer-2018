#BROKEN AF
mymatrix <- matrix(sample.int(100, size = 40*4, replace = TRUE), nrow = 40, ncol = 4)
mydata <- data.frame(mymatrix)
names(mydata) <- letters[1:4]

#Column Means
apply(mydata, 2, mean)

#Function
wl <- function(x) {
  if (x >= 50) {
    x <- "W"
  } else if (x < 50) {
    x <- "L"
  }
  return(x)
}

mydata2 <- sapply(mydata, wl)
mydata2

#Random stuff -- Piping?
a <- 100
b <- rpois(1, a)
c <- rbinom(1, n=b, 0.2)
ans <- rnorm(c, 0, 1)
ans

ans2 <- rnorm((rbinom(1, n=(rpois(1, 100)), 0.2)), 0, 1)
ans2

#Piping.
library(tidyr)
library(magrittr)
100 %>% rpois(1, .) %>% rbinom(1, ., 0.2) %>% rnorm(0, 1)

#More Piping IG
10 %>% rpois(10, .) %>% mean(.) %>% rnorm(0, 1)
