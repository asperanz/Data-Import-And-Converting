**** DATA SOURCES - IMPORT CODE EXAMPLES ****

-----------------------------------------------------------------------------------------------------------------------
** CSV FILE
library(tidyverse)

N.B. read_csv creates local dataframes WITHOUT factors

tde <- read_csv("Alpinestars Instagram Page Data Extract from Tableau.csv")
chunk <- read_csv("24. FICINT028_4810020_4898025.csv", col_types = cols(.default = "c"))

write_csv(diff_rows_127_GL_sftpvsodi, "diff_rows_127_GL_sftp_vs_odi.csv")
write_csv(cars2018, "./Data/cars2018.csv")
write_delim(chunk, 'FICINT028_CN_TP_TRANSACTIONS_ALL_H.csv', delim = '|', na = "")


-----------------------------------------------------------------------------------------------------------------------
** EXCEL SHEET
library(tidyverse)

dd_concerts <- read_excel("Dead Dogs Live Concerts.xlsx", sheet = "Sheet1")


-----------------------------------------------------------------------------------------------------------------------
** GITHUB
library(tidyverse)

* CSV Files

wildlife_impacts <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-07-23/wildlife_impacts.csv")
small_trains <- read_delim("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/small_trains.csv", delim = ",")
simpsons <- read_delim("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-08-27/simpsons-guests.csv", delim = "|", quote = "")


* RDS Files


* PDF Files

utils::download.file("https://github.com/alexlusco/blog-datasets/raw/master/Toronto_Star_Inequality_Injustice_Laid_Bare_Aug2020.pdf", here("Extract text from PDF files", "ART - Parsing your .pdfs in R", "data", "Toronto_Star_Inequality_Injustice_Laid_Bare_Aug2020.pdf"), mode = "wb")
downloader::download("https://github.com/alexlusco/blog-datasets/raw/master/Toronto_Star_Inequality_Injustice_Laid_Bare_Aug2020.pdf", here("Extract text from PDF files", "ART - Parsing your .pdfs in R", "data", "Toronto_Star_Inequality_Injustice_Laid_Bare_Aug2020.pdf"), mode = "wb")

**VERY IMPORTANT: the url to use is not the url of the github page where the pdf file is located, it's the url of the Download button
**                (dx-click on Download button > Copy link address)

-----------------------------------------------------------------------------------------------------------------------
** WEB
library(rvest)

us_airports_codes_list <- read_html("https://en.wikipedia.org/wiki/List_of_airports_in_the_United_States")
ramen_list <- read_html("https://www.theramenrater.com/resources-2/the-list/")
ucicar2 <- read_csv('http://www.win-vector.com/dfiles/car.data.csv')


-----------------------------------------------------------------------------------------------------------------------
** DATABASES


* SQL SERVER
Connecting to SQL Server Connection & Query

library(RODBC)

dbconnection <- odbcDriverConnect('driver={ODBC Driver 11 for SQL Server};server=dksqlserver.database.windows.net;database=NPD;uid=christoph@dksqlserver;pwd=Cbr600f4')

query1 <- sqlQuery(dbconnection, "SELECT a.device, CAST(ROUND(AVG(a.ctr),2) AS NUMERIC(4,2)) 'ctr'
FROM JMCADADS a, JMC_CAMPAIGNS_MAPPING m, (SELECT campaignId FROM f_get_user_active_campaigns (NULL, NULL, 1)) x
                  WHERE a.campaignID = m.OriginalCampaignId
                  AND m.UniqueCampaignId = x.campaignId
                  AND m.SourceSystem = a.Source
                  AND a.Period = 'D90'
                  GROUP BY a.device")

			  
* POSTGRESQL				  

Connecting to PostgreSQL Server Connection & Query

dbconnection <- dbConnect(dbDriver('PostgreSQL'), dbname = 'dba400L1',
						  host = 'ppappsrv02.inroma.roma.it', port = 5432,
                          user = 'pepper', password = 'hotsauce')						  