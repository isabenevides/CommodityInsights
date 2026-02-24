#' explainer UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_explainer_ui <- function(id) {
  ns <- NS(id)
  tagList(
 
  )
}
    
#' explainer Server Functions
#'
#' @noRd 
mod_explainer_server <- function(id, news_r, price_df_r){
  moduleServer(id, function(input, output, session){
    explanation <- reactive({
      news_r <- news_r()
      df <- price_df_r()
      req(nrow(news) > 0, nrow(df) > 0)

      #aqui voce cria um prompt para simples para API LLM:
      #"Dados de preço: ... noticias: .... explique por que o preço mudou hoje"
      # Implementação real : usar package openai e sua chave
      "Explicação (placeholder) - chame LLM aqui com prompt montado"
    })
 
    output$explanation <- renderUI({
      tagList(
        h4("Insights automáticos: "),
        p(explanation())
      )
    })
  })
}
    

