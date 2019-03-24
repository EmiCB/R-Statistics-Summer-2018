install.packages("tidyverse")
library(ggplot2)

surveys_complete <- read.csv("C:/Users/emicb/Desktop/R-Stats/ecology.txt", sep="\t")
View(surveys_complete)

#Normal
ggplot(surveys_complete, aes(x = weight, y = hindfoot_length)) + geom_point()

#Jitter
ggplot(surveys_complete, aes(x = weight, y = hindfoot_length)) + geom_point(position = position_jitter())

#Color
ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, color = species_id)) + geom_point(position = position_jitter())

#Transperency
ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, color = species_id)) + geom_point(alpha = 0.3, position = position_jitter())

#Shape
ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, color = species_id, shape = as.factor(plot_id))) + geom_point(alpha = 0.3, position = position_jitter())

#Lines
ggplot(surveys_complete, aes(x = weight, y = hindfoot_length, colour = species_id)) + geom_point(alpha = 0.3,  position = position_jitter()) + stat_smooth(method = "lm")

#Filter -- DOES NOT WORK
surveys_complete %>%
  filter(species_id == "DS") %>%
  ggplot(aes(x = weight, y = hindfoot_length, colour = species_id)) +
  geom_point(alpha = 0.3,  position = position_jitter()) + stat_smooth(method = "lm")

#Subset
desired_id = "PE"
ggplot(subset(surveys_complete, species_id == desired_id),
       aes(x = weight, y = hindfoot_length, colour = species_id)) +
  geom_point(alpha = 0.3,  position = position_jitter()) + stat_smooth(method = "lm") +
  ylim(c(0, 60))

#Boxplots layered
ggplot(subset(surveys_complete, !is.na(hindfoot_length)), aes(x = species_id, y = hindfoot_length)) +
  geom_point(alpha=0.3, color = "purple", position = "jitter") +
  geom_boxplot(alpha=0) + coord_flip()
