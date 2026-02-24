#Libraries 

library(shiny)
library(bslib)

app_theme <- bs_theme(
  version = 4, 
  bootswatch = "flatly",
  bg = "white", fg = "#222222", primary = "#0d6efd"
)

app_ui <- function(request) {
  navbarPage (
    title = div(img(src="logo.png", height = "30px"), "Commodity Insights"),
    id = "main_nav",
    theme = app_theme,
    windowTitle = "Commodity Insights",
    inverse = FALSE, #navbar branco (não dark)
    
    tabPanel("Market Monitor", value = "monitor",
            fluidRow(column(3, mod_market_selector_ui("ms1")),
                     column(3, mod_product_selector_ui("ps1")),
                     column(6, mod_downloads_ui("dl1"))),
            fluidRow(column(8, mod_price_chart_ui("pc1")),
                     column(4, mod_price_table_ui("pt1")))
  ),
    tabPanel("Insights", value = "insights",
          fluidRow(column(4, mod_news_scraper_ui("ns1")),
                   column(8, mod_explainer_ui("ex1")))
  ),
    tabPanel("Anomalies", value = "anomalies",
            mod_anomaly_chart_ui("an1")
  ),
    tabPanel("Projections", value = "projections",
          mod_projection_chart_ui("pr1"),
          mod_projection_explainer_ui("prx1")
  ),
    tabPanel("Journal", value = "journal",
          mod_market_jounal_ui("mj1")
  ),
    tabPanel("Admin", value = "admin",
          mod_admin_tools_ui("ad1")
  )
)
}