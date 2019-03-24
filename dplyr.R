library(dplyr)

mydata <- read.csv("C:/users/emicb/desktop/r-stats/sampledata.csv")

#Base R
head(mydata)  #See the frist rows
tail(mydata)  #See the last rows

#dplyr
sample_n(mydata, 2)       #See first 2 rows
sample_frac(mydata, .1)   #Randomly sample 10% of rows

#create duplicate
dim(mydata)
mydata[52,] <- mydata[51,]
tail(mydata)
#remove it
mydata <- distinct(mydata)
tail(mydata)

#remove duplicates in Index and keep all columns
mydata2 <- distinct(mydata, Index, .keep_all=TRUE)
mydata2

#Joining datasets
#inner_join(x, y, by=A,B,C) -- merge based on data thats in both x & y
#left_join(x, y, by=) -- ???
#right_join(x, y, by=) -- ???
#full_join(x, y, by=) -- fully merges everything

#---------------------------------------------------------------------------------
df1 = data.frame(ID = c(1, 2, 3, 4, 5),
                 Animal = c('dog', 'dog', 'cat', 'dog', 'fish'),
                 weight = c(50, 40, 1, 60, 2),
                 y=rnorm(5),
                 z=letters[1:5])

df2 = data.frame(ID = c(6, 1, 3, 2, 8),
                 Animal = c('mouse', 'dog', 'cat', 'dog', 'lemur'),
                 cuteness = c(4, 9, -4, 10, 8),
                 c =rnorm(5),
                 d =letters[2:6])

df1
df2

df3 <- inner_join(df1, df2, by="ID")
df3
df4 <- left_join(df1, df2, by="ID")
df4
df5 <- right_join(df1, df2, by="ID")
df5
df6 <- full_join(df1, df2, by="ID")
df6

#--------------
x <- seq(from = -3.5, to = 3.5, by = 0.05)
y <- dnorm(x)
windows(); plot(x,y)

x2 <- x
y2 <- dt(x2, 5)
points(x2, y2, col = "red")

#alpha = 0.05, false positive rate