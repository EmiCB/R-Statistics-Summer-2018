install.packages("ISLR")

library(splines)
library(ISLR)

attach(Wage)
?Wage

agelims <- range(age)
age.grid <- seq(from=agelims[1], to=agelims[2])

windows(); plot(age, wage, col="grey", xlab="Age", ylab="Wages")

#Linear
lin.fit <- lm(wage ~ age, data=Wage)
points(age.grid, predict(lin.fit,newdata=list(age=age.grid)), col="black", lwd=2, type="l")

#Quadratic
quad.fit <- lm(wage ~ poly(age, 2, raw=T), data = Wage)
points(age.grid, predict(quad.fit, newdata=list(age=age.grid)), col="blue", lwd=2, type="l")

#Polynomial (12 degrees)
poly.fit <- lm(wage ~ poly(age, 12, raw=T), data = Wage)
points(age.grid,predict(poly.fit, newdata=list(age=age.grid)), col="green", lwd=2, type="l")

#Polynomial (100 degrees) - BAD
badpoly.fit <- lm(wage ~ poly(age, 100, raw=T), data = Wage)
points(age.grid,predict(badpoly.fit, newdata=list(age=age.grid)), col="red", lwd=2, type="l")

#Spline
fit <- lm(wage ~ bs(age, knots = c(20,40,60)), data=Wage)
points(age.grid,predict(fit, newdata=list(age=age.grid)), col="purple", lwd=2, type="l")

#Linear spline
fit <- lm(wage ~ bs(age, knots = c(20,40,60), degree=1), data=Wage)
points(age.grid,predict(fit, newdata=list(age=age.grid)), col="red", lwd=2, type="l")

#?
abline(v=c(20, 40, 60), lty=2, col="darkgreen")

#???
fit1 <- smooth.spline(age,wage,df=16)
plot(age, wage, col="grey", xlab="Age", ylab="Wages", main="Smoothing Spline")
points(age.grid,predict(fit1, newdata=list(age=age.grid)), col="orange", lwd=2, type="l")
