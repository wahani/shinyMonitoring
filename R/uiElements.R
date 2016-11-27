#' UI Elements
#'
#' Wrapper functions for UI-Elements.
#'
#' @param ... something
#' 
#' @export
#' @rdname uiElements
boxWide <- function(...) {
  box(..., width = 12)
}

#' @param tabName (character)
#'
#' @export
#' @rdname uiElements
tabFluid <- function(tabName, ...) {
  tabItem(tabName = tabName, fluidRow(...))
}


#' @export
#' @rdname uiElements
boxFileContent <- function(...) {
  box(
    ...,
    width = 12,
    collapsible = TRUE,
    collapsed = FALSE,
    style = "max-height: 600px; overflow: auto;"
  )
}
