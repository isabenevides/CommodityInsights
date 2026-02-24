#' market_monitor UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'


mod_market_monitor_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(3, 
              mod_market_selector_ui(ns("market_selector")),
              mod_product_selector_ui(ns("product_selector")),
              br(),
              mod_downloads_ui(ns("downloads"))
       ),

       column(9,
              mod_price_chart_ui(ns("price_chart"))
        )
    ),

    hr(),

    mod_price_table_ui(ns("price_table"))
  )
}
    
#' market_monitor Server Functions

mod_market_monitor_server <- function(id) {
  moduleServer(id, function(input, output, session) {
 
    market <- mod_market_selector_server("market_selector")

    product <- mod_product_selector_server(
      "product_selector",
      market = market
    )
    
    prices <- reactive({
      req(market(), product())
      fetch_prices(market(), product())
    })

    metrics <- reactive({
      calculate_metrics(prices())
    })

    mod_price_chart_server("price_chart", prices)
    mod_price_table_server("price_table", prices)
    mod_downloads_server("downloads", prices)
})
  
}
    
