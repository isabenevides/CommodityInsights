#' fetch 
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
# R/utils_fetch.R

## finalidade do código: buscar preços ##

fetch_prices <- function(market, product){

  set.seed(match(product, c(
    "Brent","WTI","Natural Gas", "Soybeans","Corn","Wheat","Gold","Copper","Aluminum"
  )))

  base_price <- switch(market, "Energy" = 80, "Grains" = 30, "Metals" = 150, 50)  

  data.frame(
    date = seq(Sys.Date()-365, Sys.Date(), by = "day"),
    price = cumsum(rnorm(366, 0.05, 1)) + base_price
  )
}