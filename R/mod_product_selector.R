#' product_selector UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_product_selector_ui <- function(id) {
  ns <- NS(id)
  uiOutput(ns("product_ui"))
}
    
#' product_selector Server Functions

mod_product_selector_server <- function(id,market){
  moduleServer(id, function(input, output, session){
   
    products_list <- list(
      Energy = c("Brent","WTI","Natural Gas"),
      Grains = c("Soybeans","Corn","Wheat"),
      Metals = c("Gold", "Copper","Aluminum")
    )
    
    output$product_ui <-renderUI({
      req(market())
      selectInput(
        session$ns("product"),
        "Product",
        choices = products_list[[market()]]
      )
    })

    reactive(input$product)
  })
}
    
