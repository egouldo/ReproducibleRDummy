library(tidyverse)
bat_data <- read_csv("data/bat_dat.csv")

bat_data <- 
  mutate(bat_data, 
         Site = as.factor(Site),
         Habitat = as.factor(Habitat),
         Season = as.factor(Season)) %>% 
  filter(bat_data, Site != "Avoca")
