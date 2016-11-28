library("shinyMonitoring")

server <- function(input, output, session) {

  ## Folder:
  ##############################################################################

  folderInfo <- reactive({

    folderGetInfo(
      settings()$path,
      settings()$pattern,
      settings()$recursive,
      settings()$properties
    )

  })

  output$folder <- renderDataTable({
    folderInit(folderInfo(), files())
  })

  output$fileLog <- renderUI({

    if (is.null(input$folder_rows_selected)) return(NULL)
    
    fileName <- folderInfo()$file[input$folder_rows_selected]
    fileText <- readLines(fileName)

    fileText <- gsub(
      "error",
      "<span class = \"smError\">error</span>",
      fileText,
      ignore.case = TRUE
    )

    fileText <- gsub(
      "warning",
      "<span class = \"smWarning\">warning</span>",
      fileText,
      ignore.case = TRUE
    )
    
    fileText <- paste0(fileText, "<br />")
    fileText <- paste0(fileText, collapse = "")
    
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
