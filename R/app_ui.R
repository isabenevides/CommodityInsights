#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import golem
#' @import bslib
#' @noRd

app_ui <- function(request) {
  tagList(
    fluidPage(
      theme = bs_theme(
        version = 5,
        bootswatch = "superhero", #possivel testar tema darkly, lux, minty
        primary = "#2C3E50"
      ),
    golem_add_external_resources(),
     navbarPage(
      "Commodity Insights",

      tabPanel(
        "Market Monitor",
        mod_market_monitor_ui("market_monitor")
      ),

      tabPanel(
        "Insights Engine",
        mod_explainer_ui("insights_engine")
      ),

      tabPanel(
        "Anomaly Detector",
        mod_anomaly_chart_ui("anomaly_detector")
      ),

      tabPanel(
        "Projection",
        mod_projection_chart_ui("projection")
      ),

      tabPanel(
        "Journal",
        mod_market_jounal_ui("jounal")
      )
    )
  )
)
}


#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "CommodityInsights.app"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
