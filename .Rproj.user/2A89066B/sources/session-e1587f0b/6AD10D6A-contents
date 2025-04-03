outbreakSidebarUI <- function() {
  sidebarMenu(
    menuItem("Outbreak Analysis", tabName = "analysis", icon = icon("chart-line")),
    menuItem("About", tabName = "about", icon = icon("info-circle"))
  )
}

outbreakTabsUI <- function() {
  tabItems(
    tabItem(tabName = "analysis",
            fluidRow(
              box(title = "Select Data & Method", status = "primary", width = 4,
                  selectInput("dataset", "Dataset:", c("WHO", "SARI")),
                  uiOutput("seasonSelector"),
                  selectInput("method", "Method:", c("Z-score", "Prophet")),
                  actionButton("analyze", "Run Analysis")
              ),
              box(title = "Outbreak Table", status = "warning", width = 8, DTOutput("table"))
            ),
            fluidRow(
              box(title = "Visualization", status = "success", width = 12, plotOutput("plot"))
            )
    ),
    tabItem(tabName = "about",
            fluidRow(
              box(title = "About This Project", status = "info", solidHeader = TRUE, width = 12,
                  p("This project explores influenza outbreak detection using Severe Acute Respiratory Infections (SARI) and World Health Organization (WHO) data for Austria."),
                  p("Detection methods available:"),
                  tags$ul(
                    tags$li("Z-score: Identifies statistical anomalies in hospital admissions."),
                    tags$li("Prophet: Time-series forecasting model to predict and detect outbreaks.")
                  ),
                  p("Data Sources:"),
                  tags$ul(
                    tags$li(
                      HTML("SARI data: Hospital-based severe acute respiratory infection cases."),
                      tags$a(href = "https://www.sari-dashboard.at/en/opendata", " (Source)", target = "_blank")
                    ),
                    tags$li(
                      HTML("WHO data: Austrian influenza cases collected by the World Health Organization."),
                      tags$a(href = "https://www.who.int/tools/flunet", " (Source)", target = "_blank")
                    )
                  )
              )
            )
    )
  )
}
