#' projection_chart UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_projection_chart_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' projection_chart Server Functions
#'
#' @noRd 
mod_projection_chart_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_projection_chart_ui("projection_chart_1")
    
## To be copied in the server
# mod_projection_chart_server("projection_chart_1")
