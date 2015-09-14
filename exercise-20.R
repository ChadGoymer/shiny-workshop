library(shiny)
library(ggplot2)

ui <- fluidPage(
  # *Input() functions
  fluidRow(
    column(width = 4, offset = 4, 
      sliderInput(inputId = "num", label = "Choose a number", min = 0, max = 100, value = 25)
    )
  ),
  
  # *Output() functions
  fluidRow(
    column(width = 6, 
      plotOutput("hist")
    ), 
    column(width = 6, 
      plotOutput("qq")
    )
  )
  
  # layout functions
  
)

server <- function(input, output) {
  # reactive() components
  data <- reactive({rnorm(input$num)})
  
  # render*() functions (save results to ouput$)
  output$hist <- renderPlot({
    qplot(data(), geom = "histogram", xlab = "sample")
#     hist(rnorm(input$num))
  })
  
  output$qq <- renderPlot({
    qplot(sample = data(), stat = "qq")
#     qqnorm(rnorm(input$num))
  })
  
  # observeEvent(), reactive(), eventReactive() functions
  
}

shinyApp(server = server, ui = ui)
