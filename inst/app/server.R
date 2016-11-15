library("shinyMonitoring")

server <- function(input, output, session) {

  ## folder:
  ##############################################################################

  folder <- reactive({

    dat <- file.info(list.files(
      settings()$dir,
      settings()$pattern,
      full.names = TRUE,
      recursive = TRUE
    ))
    
    dat[c("isdir", "mode", "uid", "gid", "uname", "grname")] <- NULL
    dat
    
  })
  
  output$folder <- DT::renderDataTable(options = list(lengthChange = FALSE), {
    DT::datatable(folder(), selection = 'multiple')
  })

  output$fileLog <- renderUI({
    if (is.null(input$folder_rows_selected)) return(NULL)
    fileName <- rownames(folder())[input$folder_rows_selected]    
    boxWide(
      title = fileName,
      HTML(paste(readLines(fileName), collapse = "<br/>"))
    )
    
  })

  ## Settings:
  ##############################################################################

  settings <- reactive({
    settingsUse(input$settingsEditor)
  })

  observeEvent(input$settingsSave, {
    settingsSave(input$settingsEditor)
  })

  observeEvent(input$settingsRestore, {
    settingsRestore(session)
  })
  
}
