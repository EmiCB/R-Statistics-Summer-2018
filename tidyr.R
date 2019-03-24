library(tidyr)
messy <- data.frame(
  name = c("Uni", "STM", "UIUC"),
  wkd = c(320, 280, 40000),
  wke = c(2, 2, 37000)
)
messy

messy %>%
  gather(day, population, wkd:wke)
