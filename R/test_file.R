rm(list = ls())


devtools::install_github("brandonleekramer/standardizeR")
library("standardizeR")
library("dplyr")



source("R/clean_gov.R")
data(usgov_azindex)
test <- usgov_azindex %>% 
  clean_gov(agency) 



# test usgov_to_ edgelist, nodelist and graph functions 
rm(list = ls())
source("R/usgov_to_edgelist.R")
source("R/usgov_to_nodelist.R")
source("R/usgov_to_graph.R")
data(usgov_azindex)
az_edgelist <- usgov_to_edgelist(usgov_azindex)
az_nodelist <- usgov_to_nodelist(az_edgelist)
az_graph <- usgov_to_graph(usgov_azindex)
