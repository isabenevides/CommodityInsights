#' projection_explainer UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_projection_explainer_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' projection_explainer Server Functions
#'
#' @noRd 
mod_projection_explainer_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_projection_explainer_ui("projection_explainer_1")
    
## To be copied in the server
# mod_projection_explainer_server("projection_explainer_1")
