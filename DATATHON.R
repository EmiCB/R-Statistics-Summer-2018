library(xlsx)
library(dplyr)
library(Amelia)
library(ISLR)
library(splines)
library(shiny)
library(ggplot2)

#6.
Wage = Wage

ui = fluidPage("Linear and Non-Linear Regression",
               radioButtons(inputId = "LNL",
                            label = "Linear or Non-Linear Regression",
                            choices = list("Linear" = "lin", "Non-Linear" = "nln")
                            
               ),
               sliderInput(inputId = "knot1",
                           label = "Knot 1",
                           value = 20, min = 1, max = 100),
               sliderInput(inputId = "knot2",
                           label = "Knot 2",
                           value = 40, min = 1, max = 100),
               sliderInput(inputId = "knot3",
                           label = "Knot 3",
                           value = 60, min = 1, max = 100),
               plotOutput("model")
)

mod = 0

server = function(input, output){
  output$model = renderPlot({
    agelims =  range(Wage$age)
    age.grid = seq(from=agelims[1], to = agelims[2])
  
    mod = switch(input$LNL,
                 lin = 1,
                 nln = 0)
    if(mod == 1){
      lin.fit = lm(wage~age, data = Wage) 
      #plot(Wage$age,Wage$wage,col="grey",xlab="Age",ylab="wages")
      ggplot(data=Wage, aes(x=Wage$age, y=Wage$wage)) +
        geom_point(shape=1) +
        geom_smooth(method=lm,col="midnightblue",lwd=2,type="l")
      #points(age.grid,predict(lin.fit, newdata =list(age=age.grid)),col="midnightblue",lwd=2,type="l")
    }
    else if(mod == 0){
      spline.fit = lm(wage ~ bs(age, knots = c(input$knot1,input$knot2,input$knot3)),data = Wage)
      plot(Wage$age,Wage$wage,col="grey",xlab="Age",ylab="wages")
      # ggplot(Wage, aes(x=Wage$age, y=Wage$wage)) +
      #   geom_point(shape=1)
      points(age.grid,predict(spline.fit,newdata = list(age = age.grid)),col = "midnightblue",lwd=2,type='l') 
    }
  })
}

shinyApp(ui = ui, server = server)




#9.
#import a random sheet uding the import dataset first for these to work
train1 <- read_excel("C:/Users/emicb/Desktop/R-Stats/CCPP/Folds5x2_pp.xlsx", 
                     sheet = "Sheet1")
train2 <- read_excel("C:/Users/emicb/Desktop/R-Stats/CCPP/Folds5x2_pp.xlsx", 
                     sheet = "Sheet2")
train3 <- read_excel("C:/Users/emicb/Desktop/R-Stats/CCPP/Folds5x2_pp.xlsx", 
                     sheet = "Sheet3")
train4 <- read_excel("C:/Users/emicb/Desktop/R-Stats/CCPP/Folds5x2_pp.xlsx", 
                     sheet = "Sheet4")
train <- full_join(train1, train2)
train <- full_join(train, train3)
train <- full_join(train, train4)
test <- read_excel("C:/Users/emicb/Desktop/R-Stats/CCPP/Folds5x2_pp.xlsx", 
                    sheet = "Sheet5")

model <- glm(PE ~ 
               poly(AT,3,raw=T) +
               poly(V,1,raw=T) +
               poly(AP,7,raw=T) +
               poly(RH,6,raw=T) +
               sqrt(AT) +
               AT * V +
               AT * AP +
               AT * RH +
               V * RH +
               AP * RH
             , family=gaussian(link = "identity"), data=train)

summary(model)

prediction <- predict(model, test)
error <- test$PE - prediction
qqnorm(error)

rmse <- error %>% .^2 %>% mean() %>% sqrt()
rmse

write.csv(prediction, "DATATHON_Predicitons9.csv")
