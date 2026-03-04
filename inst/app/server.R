app_server <- function(input, output, session){
  #products list (o que foi codificado até agora)
  products_list <- list(
    Energy = c("Brent", "WTI"),
    Grains = c("Soybean", "Corn"),
    Metals = c("Gold","Copper")
  )

  #market/product selector module: vamos retornar reactive
  sel_r <- mod_market_jounal_server("ms1", products_list = products_list)
  #prduct_selector UI estava integrado no market_selector, se usar um separeate module chamar aqui
  

  #selected product reactive 
  
  selected_product_r <- reactive({
    sel <- sel_r()
    req(sel$market, sel$product)
    sel$product
  })

  # price data reactive for other modules 
  price_data_r <- reactive({
    req(selected_product_r())
    fetch_prices(selected_product_r(), from = Sys.Date() - months(6), to = Sys.Date())
  })


  #connect modules with listeners
  mod_price_chart_server("pc1", selected_product_r)
  mod_price_table_server("pt1", price_data_r)
  mod_downloads_server("dl1", price_data_r)

  news_r <- mod_news_scraper_server("ns1", selected_product_r)
  mod_explainer_server("ex1", news_r, price_data_r)

  mod_anomaly_chart_server("an1", price_data_r)

  mod_projection_chart_server("pr1", price_data_r)
  mod_projection_explainer_server("prx1", price_data_r)

  mod_market_jounal_server("mj1", list(price = price_data_r, news = news_r))
  mod_admin_tools_server("ad1")
}

