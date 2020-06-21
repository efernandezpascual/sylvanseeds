library(tidyverse); library(here)

load(file = here("results", "msfigs.RData"))

ggsave(p1, file = here("doc", "ms", "v3_NewPhytol", "Fig1.png"), 
       path = NULL, scale = 1, width = 150, height = 80, units = "mm", dpi = 600)

ggsave(p2, file = here("doc", "ms", "v3_NewPhytol", "Fig2.png"), 
         path = NULL, scale = 1, width = 150, height = 160, units = "mm", dpi = 600)
