#' Settings Elements
#'
#' ...
#'
#' @export
#' @rdname settings
settingsTabConfig <- function() {
  boxWide(
    title = "~/.shinyMonitoring/.config", 
    width = 12,
    aceEditor("settingsConfig", fontSize = 14, value = settingsGetConfig(), mode = "r", theme = "github"),
    shiny::actionButton("settingsSave", "Save"),
    shiny::actionButton("settingsRestore", "Restore")
  )
}


#' @param configText (character)
#' 
#' @export
#' @rdname settings
settingsSave <- function(configText) {
  writeLines(configText, "~/.shinyMonitoring/.config")
}

#' @param session the current shiny session
#' 
#' @export
#' @rdname settings
settingsRestore <- function(session) {
  updateAceEditor(session, "settingsConfig", value = settingsGetConfig())
}

#' @export
#' @rdname settings
settingsGetConfig <- function() {

  readConfig <- function() {
    paste(readLines("~/.shinyMonitoring/.config"), collapse = "\n")
  }

  configExists <- function() {
    file.exists("~/.shinyMonitoring/.config")
  }

  configInit <- function() {
    if (!dir.exists("~/.shinyMonitoring")) dir.create("~/.shinyMonitoring")
    writeLines(settingsDefault(), "~/.shinyMonitoring/.config")
    settingsDefault()
  }
  
  if (configExists()) readConfig() else configInit()
  
}

settingsDefault <- function() {
  "path <- '/var/log/'"
}
