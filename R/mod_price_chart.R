#' price_chart UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import ggplot2

mod_price_chart_ui <- function(id) {
  ns <- NS(id)
  plotly::plotlyOutput(ns("price_plot"), height = "400px")
}

mod_price_chart_server <- function(id, market_data) {
  moduleServer(id, function(input, output, session) {
    
    output$price_plot <- plotly::renderPlotly({
      
      df <- market_data()
      
      plotly::plot_ly(
        data = df,
        x = ~date,
        y = ~price,
        type = "scatter",
        mode = "lines",
        line = list(color = "#2C3E50")
      )
    })
  })
}