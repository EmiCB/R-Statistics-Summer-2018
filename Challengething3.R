tossed <- c(0, 1, 2, 3, 4, 5)
weeks <- c(5, 16, 15, 7, 6, 3)

weeks2 <- (sum(weeks))
tw <- tossed * weeks2

mean(tw)  #should be like 2.05

data <- data.frame(tossed, weeks)
plot(data)

probs <- dpois(0:5, 2)
plot(probs)
comp = 1-sum(probs)

a <- chisq.test(data, correct = FALSE, p = 0:5, rescale.p = FALSE)
a

b <- chisq.test(x=data, p=c(probs, comp))
b


#1. P
#2. lambda 2
#3. 
#4. 

#---------------------
x <- 0:5
obs <- c(5, 16, 15, 7, 6, 3)
exp <- 52*dpois(x,2)

my.chi <- sum((exp - obs)^2/(exp))
my.chi
1-pchisq(my.chi, 5)
