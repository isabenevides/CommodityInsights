#' news_scraper UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_news_scraper_ui <- function(id) {
  ns <- NS(id)
  tagList(
    actionButton(ns("refresh"), "Atualizar notícias"),
    DT::dataTableOutput(ns("news_table"))
  )
}
    
#' news_scraper Server Functions

mod_news_scraper_server <- function(id, selected_product_r){
  moduleServer(id, function(input, output, session){  
    news_cache <- reactiveVal(tibble())
 
    observeEvent(input$refresh, {
      prod <- selected_product_r()
      req(prod)

      #exemplo para procurar no google news RSS
      query <- URLencode(paste(prod, "price"))
      url <- paste0("https://news.google.com/rss/search?q=", query, "&hl=en-US&gl=US&ceid=US:en")
      feed <- xml2::read_xml(url)
      items <- xml2::xml_find_all(feed, "//item")
      news <- map_df(items, function(it){
        tibble(
          title = xml2::xml_text(xml2::xml_find_first(it, "title")),
          link = xml2::xml_text(xml2::xml_find_first(it, "link")),
          pubDate = xml2::xml_text(xml2::xml_find_first(it, "pubDate"))
        )
      })
      news_cache(news)
    }, ignoreNULL = FALSE)

    output$news_table <- DT::renderDataTable({
      req(nrow(news_cache()) > 0)
      news_cache()
    })

    return(reactive(news_cache()))
  })
}
           
