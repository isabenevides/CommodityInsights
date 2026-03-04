get_exchange_rate <- function(base = "USD", symbols = c("BRL","EUR")) {
  url <- paste0("https://api.frankfurter.app/latest?from=", base,
                "&to=", paste(symbols, collapse = ","))
  res <- httr::GET(url)
  txt <- httr::content(res, "text", encoding = "UTF-8")
  data <- jsonlite::fromJSON(txt)
  
  if (!is.null(data$rates)) {
    return(data$rates)
  } else {
    warning("Não foi possível obter taxas de câmbio")
    return(NULL)
  }
}