library(tidyverse)
library(haven)

nfhs <- read_dta("IAHR52FL.dta")

#keep var between hhid and shstuc

new_df <- nfhs %>% 
  select(hhid:shstruc)

#plotting distribution household members

ggplot(data = new_df, mapping = aes(x = hv009)) +
  geom_histogram(binwidth = 1) + 
  xlab("Number of household members")

#new df for urban household

urbanhh_df <- new_df %>% 
  select(hv025,hv026,hv009) %>% 
  filter(hv025 == 1) %>% 
  rename(urban_household = hv025) %>% 
# adding factors  
  mutate(
    urban_type = factor(hv026, labels = c("LargeCity","SmallCity","Town"))
  )
#boxplot urbanhh

ggplot(data = urbanhh_df, mapping = aes(x = urban_type, y = hv009)) + 
  geom_boxplot() + 
  labs( x = "Type of Urban", y = "Size of Household" )



