#' admin_tools UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_admin_tools_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' admin_tools Server Functions
#'
#' @noRd 
mod_admin_tools_server <- function(id){
  moduleServer(id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_admin_tools_ui("admin_tools_1")
    
## To be copied in the server
# mod_admin_tools_server("admin_tools_1")
