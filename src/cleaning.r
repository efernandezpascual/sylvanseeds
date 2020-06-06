library(tidyverse); library(here); library(sp); library(openxlsx)

# Cleaning of the search string (Supplementary file 1)

## TPL Names from common source

read.csv("../tpl/results/TPLNames.csv") -> Names
read.csv("../tpl/results/Families.csv") -> SeedFamilies

## Species file

rbind(
  read.csv("../splot12/data/Vegetation/species_Edu.csv") %>% 
    select(PlotObservationID, species, Relative.cover) %>%
    rename(Cover = Relative.cover, PlotID = PlotObservationID, Taxon = species) %>%
    mutate(PlotID = paste("Rest", PlotID, sep = "_")),
  read.csv("../splot12/data/Vegetation/forest2_1500.csv", sep = "\t") %>%
    select(Relevé.number, Species.name, Cover..) %>%
    rename(Cover = Cover.., PlotID = Relevé.number, Taxon = Species.name) %>%
    mutate(PlotID = paste("Japan", PlotID, sep = "_"))) %>%
  merge(Names, by = "Taxon", all.x = TRUE) %>%
  filter(Family %in% SeedFamilies$Family) %>%
  select(PlotID, New.ID, Cover) -> dfSpeciesRevised

## Header file

rbind(
  read.csv("../splot12/data/Vegetation/TDFNH3_Edu.csv") %>%
    filter(Herbs.identified..y.n. != "N" | 
             ! Plants.recorded %in% c("All trees & dominant shrubs", 
                                      "All woody species", 
                                      "Dominant woody plants >= 2.5 cm dbh", 
                                      "Woody plants >= 2.5 cm dbh")) %>%
    select(PlotObservationID, ECO_NAME, Altitude..m., Aspect..Â.., 
           Slope..Â.., POINT_X, POINT_Y) %>%
    rename(PlotID = PlotObservationID, 
           Ecoregion = ECO_NAME, 
           Altitude = Altitude..m., 
           Aspect = Aspect..Â.., 
           Slope = Slope..Â.., 
           Longitude = POINT_X, 
           Latitude = POINT_Y) %>%
    mutate(PlotID = paste("Rest", PlotID, sep = "_")),
  
  read.table("../splot12/data/Vegetation/japan2.txt", sep = ";", header = T) %>%
    select(PlotID, REALM:ECO_NAME) %>% 
    merge(read.csv("../splot12/data/Vegetation/forest2_1500.hea", sep = "\t", quote = ""), by = "PlotID") %>%
    filter(BIOME == 4) %>%
    select(Relevé.number, ECO_NAME, Altitude..m., Aspect...., 
           Slope...., DEG_LON, DEG_LAT) %>%
    rename(PlotID = Relevé.number, 
           Ecoregion = ECO_NAME, 
           Altitude = Altitude..m., 
           Aspect = Aspect...., 
           Slope = Slope...., 
           Longitude = DEG_LON, 
           Latitude = DEG_LAT) %>%
    mutate(PlotID = paste("Japan", PlotID, sep = "_"),
           Longitude = as.numeric(gsub("*,", ".", Longitude)),
           Latitude = as.numeric(gsub("*,", ".", Latitude)))) -> dfHeader

## Calculate frequencies, filter out rare species

dfHeader %>%
  select(PlotID, Ecoregion) %>%
  unique %>%
  group_by(Ecoregion) %>%
  summarise(T = length(Ecoregion)) -> dfTotals

merge(dfSpeciesRevised, dfHeader, by = "PlotID") %>%
  select(PlotID, New.ID, Ecoregion) %>%
  unique %>%
  group_by(Ecoregion, New.ID) %>%
  summarise(N = length(New.ID)) -> dfCounts

merge(dfCounts, dfTotals, by = "Ecoregion") %>%
  mutate(F = N/T) %>%
  filter(F > 0.05) %>% 
  pull(New.ID) %>%
  unique -> FrequentSpp

Names %>% 
  filter(New.ID %in% FrequentSpp) %>% 
  mutate(Species = paste(Genus, Species, sep = " "),
         SpeciesNew = paste(New.Genus, New.Species, sep = " ")) %>% 
  select(New.ID, Species, SpeciesNew) %>% 
  arrange(Species) -> dfFrequentNames

## Create Boolean search string

rbind(
  dfFrequentNames %>% select(Species),
  dfFrequentNames %>% select(SpeciesNew) %>% rename(Species = SpeciesNew))%>% 
  unique %>% 
  arrange(Species) %>%
  pull(Species) %>%
  paste(collapse = "” OR “") -> BooleanSpp

paste("(seed OR seeds) AND (dormancy OR germination) AND (“", BooleanSpp, "”)", sep ="") %>% 
  write.table(here("results", "Supplementary material 1 - Boolean search string.txt"), row.names = F)

# Cleaning of the database (Supplementary file 6)

read.csv(here("data", "WoS", "Forest_WoS.csv")) -> WoS

WoS %>%
  pull(Latitude) %>% as.character %>%
  char2dms(chd = "d", chm = "m", chs = "s") %>%
  as.numeric -> WoS$Latitude

WoS %>%
  pull(Longitude) %>% as.character %>%
  char2dms(chd = "d", chm = "m", chs = "s") %>%
  as.numeric -> WoS$Longitude

WoS %>%
  merge(read.xlsx(here("data", "WoS", "References.xlsx")), all.x = TRUE,  by = "Reference") %>%
  merge(read.xlsx(here("data", "WoS", "Populations.xlsx")), all.x = TRUE, by = "Population") %>%
  merge(read.csv(here("data", "WoS", "Stratification.csv")), all.x = TRUE) %>%
  merge(read.csv("../tpl/results/TPLNames.csv"), by.x = "Species", by.y = "Taxon", all.x = TRUE) %>%
  merge(read.csv(here("data", "GEB rev1", "Forest_WoS - rev1 - revisión manual de substratos.csv")), by = "Reference") %>%
  rename(Taxon = Species,
         Photoperiod = Ligh, 
         Year = Date.collection,
         Stratification_temperature = Stratification,
         Stratification_days = Stratification.days) %>%
  mutate(PopulationID = as.factor(PopulationID),
         ReferenceID = as.factor(ReferenceID),
         TPLName = as.factor(paste(New.Genus, New.Species)),
         Germinable = Replicates * Sown.per.replicate,
         Germinated = round((Germination * Germinable)/100, 0),
         Germinated = ifelse(Germinated > Germinable, Germinable, Germinated),
         Stratification = as.factor(ifelse(Stratification_type == "None", "N", "Y")),
         GA3 = as.factor(ifelse(GA == 0, "N", "Y")),
         Light = as.factor(ifelse(Photoperiod == 0, "N", "Y")),
         Alternating = as.factor(ifelse(Tmax == Tmin, "N", "Y")),
         Tdif = Tmax - Tmin,
         Tmean = Tmax * (Period / 24) + Tmin * ((24 - Period)/24),
         Temperature = cut(Tmean, seq(-7.5, 47.5, 5), 
                           labels = c("-5", "0", "5", "10", "15",
                                      "20", "25", "30", "35", "40", "45")),
         Container_number = Replicates,
         Sown_by_container = Sown.per.replicate,
         Incubation_days = Length.experiment,
         Dry_storage = Dry.storage) %>%
  filter(! is.na(Taxon)) %>%
  filter(GA3 == "N") %>%
  filter(! is.na(Germinated)) %>%
  dplyr::select(Taxon, 
                TPLName,
                Family,
                ReferenceRevised, 
                Year, 
                Country, 
                Population, 
                Latitude, 
                Longitude,
                Dry_storage,
                Setting,
                Sterilization,
                Nutrients,
                Substrate,
                Container_type,
                Container_size,
                Container_number,
                Sown_by_container,
                Incubation_days,
                Scarification, 
                Stratification_days, 
                Stratification_temperature, 
                Stratification_type, 
                Stratification,
                Light, 
                Photoperiod, 
                Alternating, 
                Tdif,
                Tmax, 
                Tmin, 
                Tmean, 
                Temperature,
                Germinated, 
                Germinable) %>%
  rename(Reference = ReferenceRevised) -> 
  WoSDB

readr::write_excel_csv(WoSDB, here::here("results", "Supplementary material 6 - Database.csv"))

# Calculate numbers for the manuscript main text

dfFrequentNames %>% pull(SpeciesNew) %>% unique %>% length -> MSfrequentspp

merge(dfHeader, dfSpeciesRevised, by = "PlotID") %>%
  select(New.ID) %>%
  unique %>%
  merge(Names, by = "New.ID") %>%
  mutate(SpeciesNew = paste(New.Genus, New.Species, sep = " ")) %>%
  pull(SpeciesNew) %>% unique %>% length -> MStotalspp

dfHeader %>% pull(PlotID) %>% unique %>% length -> MSplots

dfHeader %>% pull(Ecoregion) %>% unique %>% length -> MSecoregions

WoSDB %>% tally() -> MSrecords

WoSDB %>% pull(Reference) %>% unique %>% length -> MSreferences

WoSDB %>% pull(Family) %>% unique %>% length -> MSfamilies

WoSDB %>% pull(TPLName) %>% unique %>% length -> MSspecies

WoSDB %>% pull(Year) %>% unique() %>% min -> MSoldest

WoSDB %>% group_by(Country) %>% tally() %>% arrange(-n) -> MScountries

WoSDB$Germinable %>% sum -> MSseeds

WoSDB %>% pull(Tmean) %>% min -> MSminT

WoSDB %>% pull(Tmean) %>% max -> MSmaxT

WoSDB %>% filter(Alternating == "Y") %>% tally -> MSaltY

WoSDB %>% filter(Alternating == "N") %>% tally -> MSaltN

WoSDB %>% filter(Light == "Y") %>% tally -> MSlightY

WoSDB %>% filter(Light == "N") %>% tally -> MSlightN

WoSDB %>% filter(is.na(Light)) %>% tally -> MSlightNA

WoSDB %>% filter(Stratification_type == "None") %>% tally -> MSstratN

WoSDB %>% filter(Stratification_type == "Cold") %>% tally -> MSstratCold

WoSDB %>% filter(Scarification == "Y") %>% tally -> MSscarY

WoSDB %>% arrange(Reference) %>% pull(Reference) %>% unique -> MSrefapp

save(MSaltN, MSaltY, MScountries, MSlightN, MSlightNA, MSlightY,
     MSrecords, MSscarY, MSstratCold, MSstratN,
     MSecoregions, MSfamilies, MSfrequentspp, MSmaxT, MSminT,
     MSoldest, MSplots, MSreferences, MSseeds, MSspecies, MStotalspp,
     MSrefapp,
     file = here::here("results", "msnumbers.RData"))

# Create files for the app

library(metafor); library(binom); library(data.table)

## A function to metanalize proportions...

metanalize <- function(d) 
{
  m <- rma.glmm(measure = "PLO", xi = Germinated, ni = Germinable, data = d)
  p <- predict(m, transf = transf.ilogit, digits = 3)
  data.frame(mean = p$pred, lower = p$ci.lb, upper = p$ci.ub)
}

## Data grouped by experimental and species

WoSDB %>%
  mutate(group = paste(TPLName, Scarification, Stratification_type,
                       Light, Alternating, Temperature, sep = "_")) %>%
  data.table(.) -> df

## First we check for which groups the metanalysis works...

listd <- split(df, by = "group", drop = TRUE)
ms <- lapply(listd, function(d) tryCatch(metanalize(d), error = function(e) e))
rma.works <- names(ms)[lapply(ms, length) >= 3]

## Now we do the MA for the species that work

df.rma <- df[group %in% rma.works]
df.rma %>%
  group_by(group) %>%
  do(metanalize(.)) %>%
  group_by -> rma.species

## And for the rest, we simply calculate the proportions and CI

df[! group %in% rma.works] %>% 
  group_by(group) %>%
  summarise(Germinated = sum(Germinated), Germinable = sum(Germinable)) %>%
  data.frame -> GermDF

cbind(group = GermDF[, 1],
      binom.confint(GermDF$Germinated, GermDF$Germinable, method = "wilson")[, 4:6]) %>%
  as_tibble()-> germdf

rbind(germdf, rma.species)  %>%
  separate(group, into = c("Species", "Scarification", "Stratification_type",
                           "Light", "Alternating", "Temperature"), sep = "_", 
           convert = TRUE) %>%
  mutate(Light = ifelse(is.na(Light), "Light unknown", Light),
         Species = as.factor(Species), 
         Scarification = as.factor(Scarification), 
         Stratification_type = as.factor(Stratification_type),
         Light = as.factor(Light), 
         Alternating = as.factor(Alternating),
         Scarification = recode_factor(Scarification, "N" = "Unscarified", "Y" = "Scarified"), 
         Stratification_type = recode_factor(Stratification_type, "C+W" = "C+W-stratified", 
                                             "Cold" = "Cold-stratified",
                                             "None" = "Non-stratified",
                                             "W+C" = "W+C-stratified",
                                             "Warm" = "Warm-stratified"),
         Light = recode_factor(Light, "N" = "Darkness", "Y" = "Light"), 
         Alternating = recode_factor(Alternating, "N" = "Constant temperature", 
                                     "Y" = "Alternating temperature"),
         Experiment = paste(Light, Alternating, Stratification_type, Scarification, sep = ",\n"),
         Experiment = as.factor(Experiment)) %>%
  rename(Stratification = Stratification_type) -> Germination

## Biome map

library(raster); library(sp)
library(maps); library(mapdata); library(rgdal)
library(plyr)

## Prepare WWF shapefile

readOGR(dsn = "../wwfmap/WWF", 
        layer = "wwf_terr_ecos") -> Ecoregions
rownames(Ecoregions@data) -> Ecoregions@data$id
fortify(Ecoregions, region = "id") -> Ecoregions.points 
join(Ecoregions.points, Ecoregions@data, by = "id") %>%
  inner_join(read.csv("../wwfmap/Biomes.csv"), by = "BIOME") %>%
  filter(BIOME == 4) ->
  TBMF

WoSDB %>%
  dplyr::select(TPLName, Country, Latitude, Longitude) %>%
  dplyr::rename(Species = TPLName) %>%
  unique -> coordinates

coordinates %>%
  dplyr::select(Longitude, Latitude) %>% 
  SpatialPoints(proj4string = CRS(proj4string(Ecoregions))) %over% Ecoregions %>%
  cbind(coordinates) -> Places

save(Germination, WoSDB, Places, TBMF,
     file = here::here("results", "appdata.RData"))

# Manuscript figures

filtrar <- function(df, sp = "Quercus robur") filter(df, Species == sp)

references <- function(df1 = WoSDB, df2 = References, sp = "Quercus robur") {
  filter(df1, Species == sp) %>%
    select(ReferenceID) %>%
    merge(df2) %>%
    unique %>%
    select(Reference) %>%
    arrange(Reference) %>%
    rename(References = Reference) %>%
    as_tibble
}

mapplot <- function(df, shape = TBMF) {
  ggplot(df, aes(x = Longitude, y = Latitude)) + 
    geom_polygon(data = map_data("world"), aes(x = long, y = lat, group = group), 
                 color = "gainsboro", fill = "gainsboro") +
    geom_polygon(data = shape, aes(x = long, y = lat,group =  group), 
                 fill = "darkolivegreen4", color = "darkolivegreen4") +	
    geom_point(color = "gold", size = .5, alpha = 0.5) +
    coord_cartesian(xlim = c(-150, 180), ylim = c(-55, 80)) +
    theme(axis.line=element_blank(), axis.text.x=element_blank(),
          axis.text.y=element_blank(), axis.ticks=element_blank(),
          axis.title.x=element_blank(), axis.title.y=element_blank(),
          legend.position="none", panel.background=element_blank(),
          panel.border=element_blank(), panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(), plot.background=element_blank(),
          text = element_text(size = 12),
          plot.title = element_text(face = c("bold"), size = 14),
          plot.subtitle = element_text(face = c("italic")))
}

seedplot <- function(df) {
  ggplot(df, aes(x = as.factor(Temperature), y = mean, ymin = lower, ymax = upper, fill = Experiment)) + 
    geom_bar(stat = "identity", alpha = 0.6, show.legend = FALSE) + 
    geom_errorbar(aes(color = Experiment), width = 0.1, size = 1, 
                  position = position_dodge(.9), show.legend = FALSE) +
    coord_cartesian(ylim = c(0, 1)) +
    ylab(label = "Germination proportion") + xlab(label = "Average germination temperature (ºC)") +
    theme(text = element_text(size = 10),
          plot.title = element_text(face = c("bold"), size = 14),
          plot.subtitle = element_text(face = c("italic"))) +
    facet_wrap( ~ Experiment, scales = "free", ncol = 3)
}

p1 <- mapplot(WoSDB)

Germination %>% filter(Species == "Quercus robur") %>% seedplot -> p2

save(p1, p2,
     file = here::here("results", "msfigs.RData"))