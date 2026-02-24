#' market_jounal UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_market_jounal_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' market_jounal Server Functions
#'
#' @noRd 
mod_market_jounal_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_market_jounal_ui("market_jounal_1")
    
## To be copied in the server
# mod_market_jounal_server("market_jounal_1")
