library("shinyMonitoring")

server <- function(input, output, session) {

  ## Folder:
  ##############################################################################

  folder <- reactive({

    folderGet(
      settings()$path,
      settings()$pattern,
      settings()$recursive,
      settings()$properties
    )

  })
  
  output$folder <- DT::renderDataTable(options = list(lengthChange = FALSE), {
    DT::datatable(folder(), selection = 'multiple')
  })

  output$fileLog <- renderUI({

    if (is.null(input$folder_rows_selected)) return(NULL)
    
    fileName <- rownames(folder())[input$folder_rows_selected]
    fileText <- readLines(fileName)

    fileText <- gsub(
      "error",
      "<span class = \"sm-error\">error</span>",
      fileText,
      ignore.case = TRUE
    )

    fileText <- gsub(
      "warning",
      "<span class = \"sm-warning\">warning</span>",
      fileText,
      ignore.case = TRUE
    )
    
    fileText <- paste0(fileText, "<br />")
    
    fileText <- paste0(fileText[grep("error", fileText, TRUE)], collapse = "")
    
    boxFileContent(title = fileName, HTML(fileText))
    
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

  observeEvent(input$settingsRestoreDefault, {
    settingsRestoreDefault(session)
  })
  
}
