#1
i = 0
for(i in 1:50) {
  print(i)
}

#2
i = 0
sum = 0
for(i in 1:50) {
  sum = sum + i
}
sum

#3 - KINDA BAD
i = 0
for(i in 1:50) {
  print(i*2)
}

#4 - WRONGISH - fix later
i = 1
temp = numeric(50)
for(i in 1:50) {
  temp[i] <- i*2
}
temp

#5
sumAndMean <- function(num) {
  i = 0
  sum = 0
  for(i in 1:num) {
    sum = sum + i
  }
  mean = sum/num
  print(noquote(paste("The sum is", sum, "and the mean is", mean)))
}
sumAndMean(50)

#6 - STRUGGLED, COPPIED ANS
pBinomCopy <- function(x, succ, prob) {
  i = 0
  ans = 0
  for(i in 0:x) {
    y <- dbinom(i, succ, prob)
    ans = ans + y
  }
  print(ans)
}
pBinomCopy(1, 2,.3)
pbinom(1, 2, .3)

#7
i = 0
triangle = vector()
for(i in 1:7) {
  triangle[i] = "*"
  print(noquote(triangle))
}

#8
i = 0
triangle = vector()
for(i in 1:7) {
  triangle[i] = "*"
}
num = 7
while(num > 0) {
  print(noquote(triangle[1:num]))
  num = num - 1
  if(num == 0) break
}

#9
i = 0
for(i in 1:length(str)) {
  str = noquote(unlist(strsplit("Mr. Yu's Summer Data Science Class 2018", "")))
  str[i] = "*"
  print(noquote(str))
}

#10
str = noquote(unlist(strsplit("Uni HS and St. Thomas More", "")))
i = 0
for(i in 1:(length(str)+1)) {
  str[i-1] = "*"
  print(noquote(str))
}


#NOTES:
paste("Hello", 1, "hi") #Pastes together
