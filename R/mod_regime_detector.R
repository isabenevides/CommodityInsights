#' regime_detector UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_regime_detector_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' regime_detector Server Functions
#'
#' @noRd 
mod_regime_detector_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_regime_detector_ui("regime_detector_1")
    
## To be copied in the server
# mod_regime_detector_server("regime_detector_1")
