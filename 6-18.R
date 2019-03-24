x <- c(rpois(20, 6))
y <- x + c(rnorm(20, 0, 3))

cor(x,y)

#------------------------------
mydata <- read.csv("C:/users/emicb/desktop/r-stats/videogames.csv")
View(mydata)

library(ggplot2)

plot1 <- ggplot(mydata, aes(US.Sales..millions., Review.Score, colour = Console)) + 
  geom_point()
windows(); plot1

#-------------------------------
pov <- read.csv("C:/users/emicb/desktop/r-stats/poverty.txt", sep = "\t")
windows(); plot(pov$PocPct, pov$Brth15to17)
percent <- pov$PovPct
Br <- pov$Brth15to17
windows(); plot(percent, Br)
cor(percent, Br)
model <- lm(Br ~ percent)
model
summary(model)
windows(); plot(percent, Br); abline(22, 28, 0); abline(4.27, 1.37)
TB <- pov$TeenBrth
PP <- pov$PovPct
VC <- pov$ ViolCrime
AlbertCal <- rnorm(51, 2000, 300)

model2 <- lm(TeenBrth ~ PovPct + ViolCrime, data = pov)

model3 <- lm(TB ~ PP + VC + AlbertCal)
