# 🦠 Influenza Outbreak Detection App

A modular Shiny dashboard that detects influenza outbreaks using Austrian health data (SARI & WHO). Built with R, `shinydashboard`, `DT`, `prophet`, and `ggplot2`.

---

## 📦 Features

- 🏥 Analyze hospital-based (SARI) and WHO influenza data
- 📅 Select flu seasons and apply outbreak detection methods:
  - **Z-score** for anomaly detection
  - **Prophet** time-series forecasting
- 📊 View outbreak tables and red-flag visualizations
- 🔗 Data sources are official and open
- 💻 Built using modular best practices for maintainability

---

## 🛠️ Tech Stack

- R + Shiny + Shinydashboard
- Prophet (Facebook forecasting model)
- DataTables (`DT`)
- dplyr, zoo, ggplot2

---

## 🚀 Run the App

```r
# In R or RStudio:
shiny::runApp()
```

---

## 📁 Project Structure

```
outbreaks-detection/
├── app.R                    # Main app entry point
├── R/                      # All modular logic
│   ├── mod_ui.R
│   ├── mod_server.R
│   ├── utils_analysis.R
│   └── constants.R
├── data/                   # Preprocessed CSVs
│   ├── sari_processed.csv
│   └── who_sentinel_processed.csv
├── www/                    # CSS / assets
│   └── style.css
├── README.md
└── DESCRIPTION
```

---

## 📊 Data Sources

- [WHO FluNet](https://www.who.int/tools/flunet)
- [SARI Austria Dashboard](https://www.sari-dashboard.at/en/opendata)

---

## 📈 Future Improvements

- Add region-based filters
- Enable user-uploaded datasets
- Schedule regular Prophet re-training
- Add summary statistics and download buttons

