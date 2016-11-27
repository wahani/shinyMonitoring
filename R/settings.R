#' Settings Elements
#'
#' ...
#'
#' @export
#' @rdname settings
settingsTabConfig <- function() {
  boxWide(
    title = "~/.shinyMonitoring/.config",
    aceEditor("settingsEditor", fontSize = 14, value = settingsGetConfig(), mode = "r", theme = "github"),
    actionButton("settingsSave", "Save"),
    actionButton("settingsRestore", "Restore"),
    actionButton("settingsRestoreDefault", "Restore Default")
  )
}

#' @param configText (character)
#' 
#' @export
#' @rdname settings
settingsSave <- function(configText) {
  if (is.null(configText)) file.remove("~/.shinyMonitoring/.config") 
  else writeLines(configText, "~/.shinyMonitoring/.config")
}

#' @param session the current shiny session
#' 
#' @export
#' @rdname settings
settingsRestore <- function(session) {
  updateAceEditor(session, "settingsEditor", value = settingsGetConfig())
}

#' @export
#' @rdname settings
settingsGetConfig <- function() {

  configExists <- function() {
    file.exists("~/.shinyMonitoring/.config")
  }

  configRead <- function() {
    paste(readLines("~/.shinyMonitoring/.config"), collapse = "\n")
  }

  configInit <- function() {
    if (!dir.exists("~/.shinyMonitoring")) dir.create("~/.shinyMonitoring")
    writeLines(configDefault(), "~/.shinyMonitoring/.config")
    configRead()
  }

  configDefault <- function() {
    readLines(system.file("configDefault.R", package = "shinyMonitoring"))
  }
  
  if (configExists()) configRead() else configInit()
  
}

#' @export
#' @rdname settings
settingsUse <- function(configText) {
  writeLines(configText, tmp <- tempfile())
  use(tmp)
}

#' @export
#' @rdname settings
settingsRestoreDefault <- function(session) {
  settingsSave(NULL)
  settingsRestore(session)
}
