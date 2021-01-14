install.packages("googlesheets4")

library(googlesheets4)

table_data <- read_sheet("https://docs.google.com/spreadsheets/d/1AbSRNODMn0ypgq9AzT8h53D5PFjpg9ufVRCurM9CY2Y/edit#gid=1168553894", sheet = 1)
chart_data <- read_sheet("https://docs.google.com/spreadsheets/d/1AbSRNODMn0ypgq9AzT8h53D5PFjpg9ufVRCurM9CY2Y/edit#gid=1168553894", sheet = 2)
totals <- read_sheet("https://docs.google.com/spreadsheets/d/1AbSRNODMn0ypgq9AzT8h53D5PFjpg9ufVRCurM9CY2Y/edit#gid=1168553894", sheet = 3)

table_data2 <- read_sheet("https://docs.google.com/spreadsheets/d/1AbSRNODMn0ypgq9AzT8h53D5PFjpg9ufVRCurM9CY2Y/edit#gid=1168553894", sheet = "Table data")
chart_data2 <- read_sheet("https://docs.google.com/spreadsheets/d/1AbSRNODMn0ypgq9AzT8h53D5PFjpg9ufVRCurM9CY2Y/edit#gid=1168553894", sheet = "Chart data")
totals2 <- read_sheet("https://docs.google.com/spreadsheets/d/1AbSRNODMn0ypgq9AzT8h53D5PFjpg9ufVRCurM9CY2Y/edit#gid=1168553894", sheet = "Totals")

identical(table_data,table_data2)
identical(chart_data,chart_data2)
identical(totals,totals2)