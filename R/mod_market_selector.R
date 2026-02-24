#' market_selector UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 

mod_market_selector_ui <- function(id) {
  ns <- NS(id)


  selectInput(
    ns("market"),
    "Market",
    choices = c("Energy","Grains","Metals"),
    selected = "Energy"
  )
}

mod_market_selector_server <- function(id) {
  moduleServer(id, function(input, output, session){
    reactive(input$market)
  })
}