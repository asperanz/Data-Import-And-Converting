library(tidyverse)
library(jsonlite)

mydata <- fromJSON("https://api.musement.com/api/v3/events/536.json")

names <- tibble(names(mydata)) %>% 
  arrange(names(mydata))

df <- map_df(mydata, unlist)