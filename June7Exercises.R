#1
a <- rbinom(20, 17, .45)
hist(a)

#2
var(a)
17*.45
mean(a)

#3
u <- rbinom(2000, 40, .3)

#4
mean(u)
40*.3

#5
var(u)
40*.3*(1-.3)

#6
hist(u)
barplot(dbinom(0:20, 40, .3))

#7
#use at least 1000
u <- rbinom(2000, 10, .55)
mean(u^3)

#8
#n*p = 10
#n*p*(1-p) = 5
#10*(1-p) = 5
#(1-p) = 5/10 = 1/2
#p = .5
#n = 20
v = rbinom(10000, 20, .5)
mean(v);var(v)

#9
b <- rbinom(200, 17, .3)
mean(b);17*.3
var(b);17*.3*(1-.3)
