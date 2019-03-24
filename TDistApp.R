library(shiny)
library(ggplot2)

ui <- fluidPage(
  #Slider for N
  numericInput(inputId = "n",
              label = "n",
              value = 100, min = 1, max = NA, step = 1, width = NULL),
  #Output Histogram
  plotOutput("plot")
)
server <- function(input, output) {
  #Plot
  output$plot <- renderPlot({
    x <- seq(from = -3.5, to = 3.5, by = 0.05)
    y <- dnorm(x)
    plot(x, y,
         main = "Normal vs. T Distributions",
         xlab = "X value",
         ylab = "probability density",
         pch = 1)
    
    y2 <- dt(x, input$n)
    points(x, y2,
           pch = 2,
           col = "red")
  })
}
shinyApp(ui = ui, server = server)