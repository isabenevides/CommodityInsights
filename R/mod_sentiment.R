#' sentiment UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_sentiment_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' sentiment Server Functions
#'
#' @noRd 
mod_sentiment_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sentiment_ui("sentiment_1")
    
## To be copied in the server
# mod_sentiment_server("sentiment_1")
