#' Run the Shiny Application
#'
#' @param ... List of options to pass to golem_opts.
#' @import shiny
#' @export
run_app <- function(...) {
  with_golem_options(
    app = shinyApp(ui = app_ui, server = app_server),
    golem_opts = list(...)
  )
}