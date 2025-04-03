source("R/utils_analysis.R")

outbreakTabsServer <- function(input, output, session, sari_data, who_data) {
  output$seasonSelector <- renderUI({
    if (input$dataset == "WHO") {
      selectInput("season", "Select Season", choices = flu_seasons$label)
    }
  })
  
  observeEvent(input$analyze, {
    if (input$dataset == "SARI") {
      df <- sari_data
      result <- detect_zscore(df, "AUFNAHMEN", 2)
    } else {
      season <- flu_seasons[flu_seasons$label == input$season, ]
      df <- who_data %>% filter(ISO_WEEKSTARTDATE >= season$start & ISO_WEEKSTARTDATE <= season$end)
      result <- if (input$method == "Z-score") {
        detect_zscore(df, "INF_ALL", 3)
      } else {
        detect_prophet(df, "INF_ALL")
      }
    }
    
    output$table <- renderDT({ datatable(result, options = list(scrollX = TRUE)) })
    output$plot <- renderPlot({ plot_outbreak(result, input$method, input$dataset) })
  })
}
