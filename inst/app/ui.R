library("shinyMonitoring")

ui <- dashboardPage(

  dashboardHeader(title = "Shiny Monitoring"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Settings", tabName = "settings", icon = icon("cog")),
      menuItem("Folder", tabName = "folder", icon = icon("folder-o"))
    )
  ),
  dashboardBody(tabItems(
    tabFluid(
      tabName = "settings",
      settingsTabConfig()
    ),
    tabFluid(
      tabName = "folder",
      boxWide(DT::dataTableOutput("folder")),
      uiOutput("fileLog")
    )
  ))
)
