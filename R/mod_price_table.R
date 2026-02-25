#' price_table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_price_table_ui <- function(id) {
  ns <- NS(id)
  tableOutput(ns("price_table"))
}
    
#' price_table Server Functions

mod_price_table_server <- function(id, data){
  moduleServer(id, function(input, output, session){
    
  output$price_table <- renderTable({
  df <- req(data())
  df$date <- as.Date(df$date, origin = "1900-01-01")  
  df$date <- format(df$date, "%Y-%m-%d")
  tail(df, 10)
})

 
  })
}
