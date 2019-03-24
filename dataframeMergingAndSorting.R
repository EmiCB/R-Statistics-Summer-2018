library(dplyr)
library(tidyr)

#reading
usefulness <- read.csv("C:/users/emicb/desktop/r-stats/usefulness.txt")
weights <- read.csv("C:/users/emicb/desktop/r-stats/weights.txt")

#cleaning
usefulness <- usefulness[,-1]
weights <- weights[,-1]

#merging
mydata <- full_join(usefulness, weights)
mydata

#sorty by ID
mydata <- mydata[order(mydata$ID),]
mydata


#Are cats and owls equally useful?
catdata <- filter(mydata, pet == "cat")
owldata <- filter(mydata, pet == "owl")

catuse <- catdata$usefulness
owluse <- owldata$usefulness

t.test(catuse, owluse, alternative = "two.sided")


#Cats & owls weigh same
catweight <- catdata$weight
owlweight <- owldata$weight

t.test(catweight, owlweight, alternative = "two.sided")
