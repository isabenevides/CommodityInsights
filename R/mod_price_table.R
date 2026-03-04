#' price_table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
library(dplyr)
mod_price_table_ui <- function(id) {
  ns <- NS(id)
  DT::dataTableOutput(ns("price_table"))
}
    
#' price_table Server Functions

mod_price_table_server <- function(id, data){
 moduleServer(id, function(input, output, session){
    
    output$price_table <- DT::renderDataTable({
      df <- req(data())
      df$date <- as.Date(df$date, origin = "1900-01-01")  
      df$date <- format(df$date, "%Y-%m-%d")
      
      # Buscar taxas reais com cache
      rates <- update_exchange_rates()
      if (is.null(rates) || length(rates) == 0) {
        return(data.frame(Mensagem = "Taxas de câmbio não disponíveis"))
      }

      # Criar colunas adicionais
      df <- df %>%
        mutate(
          price = round(price,2),
          price_brl = round(price * rates[["BRL"]], 2),
          price_eur = round(price * rates[["EUR"]], 2),
          daily_change = round((price / lag(price) - 1) * 100, 2),
          status = case_when(
            daily_change > 2 ~ "<span style='color:green;font-weight:bold'>Em alta</span>",
            daily_change < -2 ~ "<span style='color:red;font-weight:bold'>Em queda</span>",
            TRUE ~ "<span style='color:gray'>Estável</span>"

          )
        )  %>%
        arrange(desc(date)) 
      
       DT::datatable(
        df,
        options = list(pageLength = 10),
        rownames = FALSE,
        escape = FALSE
      )

    })
    
  })
}