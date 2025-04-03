library(shiny)
library(shinydashboard)
source("R/constants.R")
source("R/mod_ui.R")
source("R/mod_server.R")

sari_data <- read.csv("data/sari_processed.csv")
who_data <- read.csv("data/who_sentinel_processed.csv")
sari_data$ISO_WEEKSTARTDATE <- as.Date(sari_data$ISO_WEEKSTARTDATE)
who_data$ISO_WEEKSTARTDATE <- as.Date(who_data$ISO_WEEKSTARTDATE)

ui <- dashboardPage(
  dashboardHeader(title = "Influenza Outbreak Detection", titleWidth = 1000),
  dashboardSidebar(outbreakSidebarUI()),
  dashboardBody(
    tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
    outbreakTabsUI()
  )
)

server <- function(input, output, session) {
  outbreakTabsServer(input, output, session, sari_data, who_data)
}

shinyApp(ui, server)
