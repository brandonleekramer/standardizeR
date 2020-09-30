rm(list = ls())


devtools::install_github("brandonleekramer/standardizeR")
library("standardizeR")
library("tidyverse")


az_index <- readr::read_csv("data/az_index.csv")
source("R/clean_government.R")

test <- az_index %>% 
  clean_gov(Agency) %>% 
  select(Agency, institution)


