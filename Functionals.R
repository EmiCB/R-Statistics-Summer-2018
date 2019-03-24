set.seed(2018)
rnorm(50)
mydata <- data.frame(replicate(8, sample(c(1:10, -1), 50, rep = TRUE)))
mydata

names(mydata) <- letters[2:9]

mydata$b[mydata$b == -1] <- NA
mydata[mydata == -1] <- NA

neg_fixer <- function(x) {
  x[x == -1] <- NA
  x
}

mydata2 <- lapply(mydata, neg_fixer)
mydata2
mydata3 <- sapply(mydata, neg_fixer)
mydata3
