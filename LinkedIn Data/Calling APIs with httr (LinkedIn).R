###### How to call Intrinio APIs with httr package ######

library(httr)
library(tidyverse)
library(jsonlite)


API_Key_sandbox <- "OmUzOWI0MWNlNDM2NThhMmFkMjYyMDI2NTNmZTEwNzhi"

call <- "https://api-v2.intrinio.com/companies/AAPL?api_key=OmUzOWI0MWNlNDM2NThhMmFkMjYyMDI2NTNmZTEwNzhi"

get_prices <- GET(call, type = "basic")

get_prices_text <- content(get_prices, "text")

get_prices_json <- fromJSON(get_prices_text, flatten = TRUE)

get_prices_df <- data.frame(unlist(get_prices_json))

get_prices_df2 <- get_prices_df %>% 
  rownames_to_column(var="column") %>% 
  remove_rownames %>%
  rename(value = unlist.get_prices_json.)

get_prices_df3 <- get_prices_df2 %>%
  pivot_wider(names_from = column, values_from = value) 




###### How to call Linkedin APIs with httr package ######

library(httr)
library(tidyverse)
library(jsonlite)


endpoints <- oauth_endpoints("linkedin")

myapp <- oauth_app("ILS_Analytics",
                   key = "86fbee96yz2fo7",
                   secret = "UH8HBJaG8PsGseOi"
)

token <- oauth2.0_token(endpoints, myapp, scope = "r_liteprofile")

req_linkedin <- GET("https://api.linkedin.com/v2/me", config(token = token))

get_info_text <- content(req_linkedin, "text")

get_info_json <- fromJSON(get_info_text, flatten = TRUE)

# Create a dataframe
get_info_df <- data.frame(unlist(get_info_json))

# Tidying the dataframe
get_info_df2 <- get_info_df %>% 
  rownames_to_column(var="column") %>% 
  remove_rownames %>%
  rename(value = unlist.get_info_json.)

# Pivoting the dataframe to have the final tidy dataframe
get_info_df3 <- get_info_df2 %>%
  pivot_wider(names_from = column, values_from = value) 