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
  DT::dataTableOutput(ns("price_table"))
}

#' price_table Server Functions
mod_price_table_server <- function(id, data){
  moduleServer(id, function(input, output, session){
    
    output$price_table <- DT::renderDataTable({
      df <- tail(data(), 10)
      
      # Formata a coluna 'date' só para exibição
      df$date <- format(df$date, "%d/%m/%Y")
      
      DT::datatable(
        df,
        options = list(pageLength = 10),
        rownames = FALSE
      )
    })
    
  })
}