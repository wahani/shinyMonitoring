#' UI Elements
#'
#' Wrapper functions for UI-Elements.
#'
#' @param ... something
#' 
#' @export
#' @rdname uiElements
boxWide <- function(...) {
  box(..., background = "light-blue", width = 12)  
}

#' @param tabName (character)
#'
#' @export
#' @rdname uiElements
tabFluid <- function(tabName, ...) {
  tabItem(tabName = tabName, fluidRow(...))
}
