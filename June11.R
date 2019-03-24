#sigma(a, n=0) * (lambda^n * (1/factorial(n)))
lambda <- 10
a <- 0
nStart <- 0
nEnd <- 100
for(n in nStart:nEnd) {
  a <- a + ((lambda^n)*(1/factorial(n)))
}
a

#
x <- rnorm(1, 100, 10)
n <- 30    #sample size
xvec <- rnorm(n, 100, 10)
mean(xvec)

