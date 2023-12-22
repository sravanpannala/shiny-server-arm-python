library(shiny)
library(ggplot2)
ui <- fluidPage(
  tags$h3("Scatter plot generator"),
  selectInput(inputId = "x", label = "X Axis", choices = names(mtcars), selected = "mpg"),
  selectInput(inputId = "y", label = "Y Axis", choices = names(mtcars), selected = "hp"),
  plotOutput(outputId = "scatterPlot")
)
server <- function(input, output, session) {
  data <- reactive({mtcars})
  
  output$scatterPlot <- renderPlot({
    ggplot(data = data(), aes_string(x = input$x, y = input$y)) + 
      geom_point(aes(size = qsec, color = factor(cyl))) + 
      scale_color_manual(values = c("#3C6E71", "#70AE6E", "#BEEE62")) +
      theme_classic() + 
      theme(legend.position = "none")
  })
}
shinyApp(ui = ui, server = server)