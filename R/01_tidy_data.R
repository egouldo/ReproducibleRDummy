library(tidyverse)
bat_data <- read_csv("data/bat_dat.csv")

bat_data <- 
  mutate(bat_data, 
         Site = as.factor(Site),
         Habitat = as.factor(Habitat),
         Season = as.factor(Season)) %>% 
  filter(Site != "Avoca") %>% 
  dplyr::mutate(Taust_Vdarl = Taustralis + Vdarlingtoni) %>% 
  select(-Taustralis, -Vdarlingtoni)


bat_data %>% 
  group_by(Site, Season) %>% 
  dplyr::summarise(mean_Chgouldii = mean(Chgouldii), 
                   mean_Chmorio = mean(Chmorio)) %>% 
  write_csv("data/processed/mean_gouldii_morio_abundance.csv")
