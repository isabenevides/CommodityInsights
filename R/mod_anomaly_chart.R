#' anomaly_chart UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_anomaly_chart_ui <- function(id) {
  ns <- NS(id)
  tagList(
      plotly::plotlyOutput(ns("anomaly_plot"))
  )
}
    
#' anomaly_chart Server Functions
#'
#' @noRd 
mod_anomaly_chart_server <- function(id, data_r){
  moduleServer(id, function(input, output, session){
    anomalies_r <- reactive({
      df <-data_r()
      req(nrow(df)) > 0 
      #marcar pontos onde daily return > mean + 3*sd
      mu <- mean(df$ret_1d, na.rm = TRUE)
      sdv <- sd(df$ret_1d, na.rm = TRUE)
      df %>% mutate(is_anom = abs(ret_1d - mu)> 3*sdv)
    })

    output$anomaly_plot <- plotly::renderPlotly({
      df <- anomalies_r()
      p <- ggplot(df, aes(date, price)) +
        geom_line()+
        geom_point(data = filter(df, is_anom), aes(date, price), calor ="red", size = 2)
      plotly::ggplotly(p)
    })
  })
}
    
