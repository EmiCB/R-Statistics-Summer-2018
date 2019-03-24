#-----Hypothesis Testing-----
#---1. HYPOTHESIS---
#2 - tailed test
#Ho: mu = 32.44
#Ha: mu != 32.44

#---2. TEST STATISTIC---
#Z = (avg(x) - mu) / sigma
#Z = (31.37-32.44) / (3.70/sqrt(50)) = -2.04

#---3. P-VALUE---
pvalue <- 2*(pnorm(-2.04, 0, 1))
pvalue

#-----T-test-----
#ONE SAMPLE
#max = 0.3
samples <- c(0.28, 0.15, 0.33, 0.4, 0.22, 0.29, 0.51, 0.39, 0.41)
mean(samples)
sd(samples)
#t = (avg(x) - mu) / (s/sqrt(n))
#t = 0.34 - 0.3 / 0.1186/sqrt(9) = 0.011
#df = n-1
pt(0.011, 8, lower.tail = F)
t.test(samples, alternative = "greater", mu = 0.3)

#TWO SAMPLE
#treat = control
#treat < control
treat <- c(90, 88, 99, 77, 88, 91)
control <- c(101, 90, 104, 92, 100, 98)
sd(treat)
sd(control)
#assume they have same sd
t.test(treat, control, alternative = "less", var.equal = TRUE)
#assume they do not have same sd
t.test(treat, control, alternative = "less")

#PAIRED
prem <- c(18, 19, 19, 22, 24, 24, 25, 25, 26, 26, 28, 32)
reg <- c(16, 16, 16, 20, 21, 22, 23, 22, 27, 25, 27, 28)
t.test(prem, reg, alternative = "greater", paired = TRUE)

