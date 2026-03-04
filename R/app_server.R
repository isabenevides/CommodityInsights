#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
#' 
exchange_rates <- shiny::reactiveVal(NULL)
last_update <- shiny::reactiveVal(Sys.time())

update_exchange_rates <- function() {
  if (is.null(exchange_rates()) || difftime(Sys.time(), last_update(), units = "mins") > 60) {
    rates <- get_exchange_rate("USD", c("BRL","EUR"))
    exchange_rates(rates)
    last_update(Sys.time())
  }
  return(exchange_rates())
}

app_server <- function(input, output, session) {
mod_market_monitor_server("market_monitor")
}
