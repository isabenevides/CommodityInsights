#' downloads UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 

#________________________________________

mod_downloads_ui <- function(id) {
  ns <- NS(id)
    downloadButton(ns("download_data"), "Download CSV")
}

#' downloads Server Functions
mod_downloads_server <- function(id, data_r){
  moduleServer(id, function(input, output, session){
    
    # Download CSV
    output$download_data<- downloadHandler(
      filename = function() {
        paste0("commodity_data_", Sys.Date(), ".csv")
      },
      content = function(file){
        write.csv(data(), row.names = FALSE)
      }
    )
  })
}
  