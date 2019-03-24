#Make a function that takes F and returns C
fToC <- function(f) {
  c <- (f-32) * (5/9)
  print(c)
}

#
pvector <- numeric(6)

i = 0
for(i in 1:length(pvector)) {
  pvector[i] <- dbinom(i-1, 5, 0.4)
}
pvector

xs <- 0:5
crossprod(xs, pvector)

#
pvector <- numeric(31)
i = 0
for(i in 1:length(pvector)) {
  pvector[i] <- dbinom(i-1, 30, 0.15)
}
pvector
xs <- 0:30
crossprod(xs, pvector)

#
v <- rbinom(100, 7, .3)
barplot(table(v))

barplot(dbinom(0:7, 7, .3))
