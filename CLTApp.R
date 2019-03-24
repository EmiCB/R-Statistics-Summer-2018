library(shiny)
library(ggplot2)

#V1 - WORKING
ui <- fluidPage(
  #Slider for N
  sliderInput(inputId = "n",
              label = "Number of Trials",
              value = 100, min = 1, max = 200),
  #Slider for Repetitions
  sliderInput(inputId = "reps",
              label = "Repetitions",
              value = 500, min = 1, max = 1000),
  #Output Histogram
  plotOutput("hist")
)
server <- function(input, output) {
  #Set values & create distribution
  x <- c(1, 2, 4, 8, 16, 32, 64)
  probability <- c(.6, .045,.005, 0.01, 0, .04, .3)
  xBar = vector()
  #Plot Histogram
  output$hist <- renderPlot({
    #Mathy Stuff
    for(i in 0:input$reps) {
      mySample <- sample(x, size=input$n, replace = T, prob = probability)
      xBar[i] <- mean(mySample)
      i = i + 1
    }
    data <- data.frame(xBar)
    ggplot(data, aes(xBar)) + 
      geom_histogram(
        col = "black",
        fill = "purple",
        alpha = .2
        ) +
      labs(x="xBar", y="P(xBar)") +
      ylim(c(0, 125))
  })
}
shinyApp(ui = ui, server = server)
