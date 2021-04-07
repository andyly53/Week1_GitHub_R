library(tidyverse)
library(haven)

nfhs <- read_dta("IAHR52FL.dta")

#keep var between hhid and shstuc

new_df <- nfhs %>% 
  select(hhid:shstruc)
