library(ggplot2)

ui <- fluidPage(
  #Slider for X
  sliderInput(inputId = "n",
              label = "n",
              value = 10, min = 1, max = 25, step = 1),
  #Output plot
  plotOutput("dist")
)
server <- function(input, output) {
  #Plot
  output$dist <- renderPlot({
    x <- seq(from = 1, to = 100, by = .01)
    y <- dchisq(x, input$n)
    data <- data.frame(x, y)
    
    ggplot(data, aes(x=x, y=y)) +
      geom_point(aes(x=x, y=y))
  })
}
shinyApp(ui = ui, server = server)