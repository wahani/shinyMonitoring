library("shinyMonitoring")

server <- function(input, output, session) {

  ## Settings:
  ##############################################################################

  observeEvent(input$settingsSave, {
    settingsSave(input$settingsConfig)
  })

  observeEvent(input$settingsRestore, {
    settingsRestore(session)
  })
  
}
