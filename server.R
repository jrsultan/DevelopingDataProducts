library(shiny)
library(ggplot2)

# Define server logic to plot various variables against price ----
server <- function(input, output) {
  
  # Compute the formula text ----
  # This is in a reactive expression since it is shared by the
  # output$caption and output$diaPlot functions
  formulaText <- reactive({
    paste("price ~", input$variable)
  })
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against price ----
  # and only exclude outliers if requested
  output$diaPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = diamonds,
            outline = input$outliers,
            col = "red", pch = 15)
  })
  
}