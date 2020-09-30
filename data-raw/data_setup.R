
# government_data
government_data <- readr::read_csv("data-raw/government_data.csv")
devtools::use_data(government_data, overwrite = TRUE)
