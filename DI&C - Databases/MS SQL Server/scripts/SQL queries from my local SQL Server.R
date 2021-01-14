library(tidyverse)
library(janitor)
library(funModeling)
library(RODBC)

## Local DB Connections

# AdventureWorks2017
AdventureWorks2017_dbConnection <- "Driver={SQL Server};Server=ASPERANZ-PC\\MSSQLSERVER2017;Database=AdventureWorks2017;trusted_connection=yes"
AW2017_channel <- odbcDriverConnect(AdventureWorks2017_dbConnection)

cities <- RODBC::sqlQuery(AW2017_channel, "select distinct city from dbo.orders", as.is=c(TRUE, FALSE)
)