library(prophet)
library(zoo)
library(dplyr)
library(ggplot2)
library(DT)


detect_zscore <- function(df, col, threshold = 3) {
  df %>%
    mutate(
      MA14 = rollmean(get(col), k = 14, fill = NA, align = "right"),
      STD14 = rollapply(get(col), 14, sd, fill = NA, align = "right"),
      Z_Score = (get(col) - MA14) / STD14,
      Outbreak = Z_Score > threshold
    )
}

detect_prophet <- function(df, col) {
  model <- prophet(yearly.seasonality = TRUE, weekly.seasonality = FALSE)
  df_prophet <- df %>% select(ds = ISO_WEEKSTARTDATE, y = !!sym(col))
  model <- fit.prophet(model, df_prophet)
  future <- make_future_dataframe(model, periods = 52, freq = "week")
  forecast <- predict(model, future)
  df <- left_join(df, forecast %>% select(ds, yhat_upper), by = c("ISO_WEEKSTARTDATE" = "ds"))
  df %>% mutate(Outbreak = get(col) > yhat_upper)
}

plot_outbreak <- function(df, method, dataset) {
  col <- ifelse(dataset == "SARI", "AUFNAHMEN", "INF_ALL")
  ggplot(df, aes(x = ISO_WEEKSTARTDATE, y = get(col))) +
    geom_line(color = "blue") +
    geom_point(data = df[df$Outbreak == TRUE, ], aes(y = get(col)), color = "red", size = 3) +
    labs(title = paste("Outbreak Detection Using", method), x = "Date", y = col) +
    theme_minimal()
}
