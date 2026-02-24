#' process 
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
#' 
#' 
library(dplyr)
library(lubridate)
library(zoo) #rollapp se necessário

calculate_metrics <- function(df) {
  last_price <- tail(df$price, 1)

  daily_change <- (last_price / df$price[nrow(df)-1] -1) *100
  weekly_change <-(last_price / df$price[nrow(df)-7] -1) *100
  monthly_change <-(last_price / df$price[nrow(df)-30]-1) *100

  returns <- diff(log(df$price))
  vol_30d <- sd(tail(returns, 30)) *sqrt(252) *100

  list(
    last_price = round(last_price, 2),
    daily = round(daily_change,2),
    weekly = round(weekly_change, 2),
    monthly = round(monthly_change, 2),
    vol_30d = round(vol_30d, 2)
  )
}