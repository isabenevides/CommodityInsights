#' market_monitor UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 

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
      ),

      column(3, uiOutput(ns("kpi_price"))),
      column(3, uiOutput(ns("kpi_weekly"))),
      column(3, uiOutput(ns("kpi_monthly"))),
      column(3, uiOutput(ns("kpi_vol")))
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
    
    output$price_table <- DT::renderDataTable({
      df <- prices()

      df$date <- as.Date(df$date, origin = "1900-01-01")
      df$date <- format(df$date, "%Y-%m-%d")
    
      DT::datatable(
        df,
        options = list(pageLength = 10),
        rownames = FALSE
      )
    })

    kpi_data <- reactive({
      df <- prices()

      current_price <- tail(df$price, 1)

      daily_return   <- (tail(df$price, 1) / tail(df$price, 2)[1] - 1) * 100
      weekly_return  <- (tail(df$price, 1) / tail(df$price, 8)[1] - 1) * 100
      monthly_return <- (tail(df$price, 1) / tail(df$price, 31)[1] - 1) * 100

      returns  <- diff(log(df$price))
      vol_30d  <- sd(tail(returns, 30)) * 100

      list(
        price   = round(current_price, 2),
        daily   = round(daily_return, 2),
        weekly  = round(weekly_return, 2),
        monthly = round(monthly_return, 2),
        vol     = round(vol_30d, 2)
      )
    })

    output$kpi_price <- renderUI({
      kpi <- kpi_data()

      div(
        style = "background:white; padding:20px; border-radius:12px;
                 box-shadow:0 4px 12px rgba(0,0,0,0.08);",

        h6("Current Price", style = "color:gray;"),
        h2(paste0("$ ", kpi$price))
      )
    })

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
