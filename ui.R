
library(shiny)
library(ggplot2)

# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Diamonds: Price vs. Other Variables"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against price ----
      selectInput("variable", "Variable:",
                  c("Cut" = "cut",
                    "Color" = "color",
                    "Clarity" = "clarity")),
      
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Formatted text for caption ----
      h3(textOutput("caption")),
      
      # Output: Plot of the requested variable against price ----
      plotOutput("diaPlot")
      
    )
  )
)