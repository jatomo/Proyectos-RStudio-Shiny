library(shiny)

ui <- fluidPage(
  titlePanel("Planificador de Eventos"),
  
  sidebarLayout(
    sidebarPanel( 
      width = 5,
      br(),
      textInput(inputId = " Nombre", 
                label = "Nombre del Evento:"),
      br(),
      selectInput(inputId = "Tema",    
                  label = "Tema del evento:", 
                  choices = c("Boda", "Fiesta de Cumpleaños", "Conferencia", "Otra"),
                  multiple = FALSE),
      
      numericInput(inputId = "Invitados",
                   label = "Número de Invitados:", 
                   value = 30, 
                   min = 25,
                   max = 120),
      
      selectInput(inputId = "Provincia",
                  label = "Seleccione la provincia en la que vive:",
                  choices = c("Puntarenas", "Heredia", "Cartago", "Limón", "San José", "Alajuela", "Guanacaste"),
                  multiple = FALSE)
      
    ), 
    mainPanel(
      width = 7,
      h3(div("¡Vamos a planificar su Día Especial!", style = "color:blue", align = "center")),
      tags$hr(style = "border-color:blue;"), 
      h3(style = "font-size: 20px;", HTML("<strong>Detalles del evento:</strong>")),
      br(),
      textOutput("evento_output"), 
      br(),
      tags$hr(),
      textOutput("tema_output"),
      br(),
      tags$hr(),
      textOutput("invitados_provincia_output")
    )
  )
)

server <- function(input, output) {
  output$evento_output <- renderText({
    evento <- input$nombre
    paste("Evento:", evento)
  })
  
  output$tema_output <- renderText({
    tema <- input$tema
    paste("Tema del Evento:", tema)
  })
  
  output$invitados_provincia_output <- renderText({
    tema <- input$tema
    invitados <- input$invitados
    provincia <- input$provincia
    paste("Número de invitados y ubicación: El evento '", tema, "' tendrá ", invitados, " invitados y será llevado a cabo en ", provincia, ".")
  })
}

shinyApp(ui, server)