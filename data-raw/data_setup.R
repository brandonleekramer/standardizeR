
# government_data
gov_strings <- readr::read_csv("data-raw/gov_strings.csv")
usethis::use_data(gov_strings, overwrite = TRUE, compress = "xz")

