install.packages("shiny")
library(shiny)

#Basic template for Shiny apps
ui <- fluidPage()
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Inside of the flid page, wewill have input functions and output functions

#App
ui <- fluidPage(
  #Input
  sliderInput(inputId = "trials",
              label = "Number of Trials",
              value = 500, min = 1, max = 1000),
  sliderInput(inputId = "n",
              label = "n",
              value = 15, min = 1, max = 30),
  sliderInput(inputId = "prob",
              label = "Probability",
              value = .5, min = 0, max = 1),
  #Output
  plotOutput("hist")
  )
server <- function(input, output) {
  #Make a histogram
  output$hist <- renderPlot({
    hist(rbinom(input$trials, input$n, input$prob))
  })
}
shinyApp(ui = ui, server = server)

#Use Shiny to make 2 different apps
#1) User inputs a value of P, and number of trials. Trials go between 1 & 1000
#Generate random variables from a geometric distribution and plot a histogram
#2) Poisson distribution, user inputs lambda, plot the probablility distribution
#x 1:50

#1 - rgeom()
ui <- fluidPage(
  sliderInput(inputId = "trials",
              label = "Number of Trials",
              value = 500, min = 1, max = 1000),
  sliderInput(inputId = "prob",
              label = "Probability",
              value = .5, min = 0, max = 1),
  plotOutput("hist")
  )
server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rgeom(input$trials, input$prob),
         main = "Geometric Simulation",
         xlab = "Simulation", ylab = "Frequency")
  })
}
shinyApp(ui = ui, server = server)

#2 - dpois()
ui <- fluidPage(
  sliderInput(inputId = "lmb",
              label = "Lambda",
              value = 10, min = 1, max = 20),
  plotOutput("barplot")
)
server <- function(input, output) {
  output$barplot <- renderPlot({
    barplot(dpois(0:50, input$lmb),
            main = "Poisson Probabilities",
            xlab = "X", ylab = "Frequency")
  })
}
shinyApp(ui = ui, server = server)
