library("shinyMonitoring")

server <- function(input, output, session) {

  ## Folder:
  ##############################################################################

  folder <- reactive({

    folderGet <- function(path, pattern, recursive, properties) {

      dat <- file.info(list.files(
        path,
        pattern,
        full.names = TRUE,
        recursive = recursive,
        include.dirs = FALSE
      ))
    
      dat[properties]
      
    }

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
