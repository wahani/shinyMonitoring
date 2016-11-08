library("shinyMonitoring")

server <- function(input, output, session) {

  ## folder:
  ##############################################################################

  folder <- reactive({
    dat <- file.info(list.files("/var/log", ".log$", full.names = TRUE))
    dat[c("isdir", "mode", "uid", "gid", "uname", "grname")] <- NULL
    dat
  })
  
  output$folder <- DT::renderDataTable(options = list(lengthChange = FALSE), {
    DT::datatable(folder(), selection = 'single')
  })

  output$fileLog <- renderUI({
    if (is.null(input$folder_rows_selected)) return(NULL)
    boxWide(renderText(
      readLines(rownames(folder())[input$folder_rows_selected])
    ))
  })

  ## Settings:
  ##############################################################################

  observeEvent(input$settingsSave, {
    settingsSave(input$settingsConfig)
  })

  observeEvent(input$settingsRestore, {
    settingsRestore(session)
  })
  
}
