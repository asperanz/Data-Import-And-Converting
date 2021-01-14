library(tidyverse)
library(rjson)

mydata <- fromJSON(file="https://api.musement.com/api/v3/events/536.json")

mydata_names <- names(mydata)

class(mydata_names) #character

names <- tibble(names(mydata)) %>% 
  arrange(names(mydata))

# Unlist nested lists
city_list <- purrr::map_df(mydata[["city"]], unlist) %>% 
  janitor::clean_names()

flavours_list <- purrr::map_df(mydata[["flavours"]], unlist) %>% 
  janitor::clean_names()

verticals_list <- purrr::map_df(mydata[["verticals"]], unlist) %>% 
  janitor::clean_names()

# Single values
operational_days <- mydata[["operational_days"]]

class(operational_days) #character

# TARGET: vedere come creare un dataframe direttamente dalla lista senza creare variabili o dataframes
# intermedi da incollare uno di seguito all'altro