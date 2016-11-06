library("shinyMonitoring")

ui <- dashboardPage(

  dashboardHeader(title = "Shiny Monitoring"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Settings", tabName = "settings", icon = icon("cog"))
    )
  ),
  dashboardBody(
    tabFluid(
      tabName = "settings",
      settingsTabConfig()
    )
  )
)
