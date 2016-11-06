#' UI Elements
#'
#' Wrapper functions for UI-Elements.
#'
#' @param ... something
#' 
#' @export
#' @rdname uiElements
boxWide <- function(...) {
  box(..., background = "light-blue")  
}

#' @param tabName (character)
#'
#' @export
#' @rdname uiElements
tabFluid <- function(tabName, ...) {
  tabItem(tabName = tabName, fluidRow(...))
}
