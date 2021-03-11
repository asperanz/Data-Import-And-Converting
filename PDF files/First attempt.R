library(tidyverse)
library(funModeling)
library(pdftools)

# Get data from pdf file - TO CONTINUE
```{r get_data_from_pdf}
cities_5g <- pdf_data("I 120 comuni coinvolti nella sperimentazione 5G - Extracted pages.pdf")

gino <- cities_5g[[1]][["text"]]
gino2 <- cities_5g[[2]][["text"]]
gino3 <- cities_5g[[3]][["text"]]
gino4 <- cities_5g[[4]][["text"]]

data <- tibble(c(gino, gino2))
```