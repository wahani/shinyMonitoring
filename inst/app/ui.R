library("shinyMonitoring")

ui <- dashboardPage(

  dashboardHeader(title = "Shiny Monitoring"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Settings", tabName = "settings", icon = icon("cog")),
      menuItem("Folder", tabName = "folder", icon = icon("folder"))
    )
  ),
  dashboardBody(
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "shinyMonitoring.css"
      )
    ),
    tabItems(
      tabFluid(
        tabName = "folder",
        boxWide(DT::dataTableOutput("folder")),
        uiOutput("fileLog")
      ),
      tabFluid(
        tabName = "settings",
        settingsTabConfig()
      )
    ))
)
