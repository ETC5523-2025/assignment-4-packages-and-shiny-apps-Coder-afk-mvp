#' Launch the Interactive Shiny App
#'
#' Opens an interactive Shiny application included in the **NamesR** package.
#' The app provides a visual interface to explore the `common_names` dataset —
#' allowing users to filter by gender, search for names, and compare frequencies
#' across the top 20 most common first names in the United States (2013).
#'
#' @details
#' This app is built using \pkg{shiny}, \pkg{ggplot2}, and \pkg{bslib}.
#' It is located in the `inst/eda-app` directory of the package.
#'
#' When you run this function, it automatically launches the application
#' in your default web browser.
#'
#' @return
#' No return value — the function is called for its side effect of launching the app.
#'
#' @examples
#' \dontrun{
#' run_app()
#' }
#'
#' @export
run_app <- function() {
  app_dir <- system.file("eda-app", package = "NamesR")
  shiny::runApp(app_dir, display.mode = "normal")
}
