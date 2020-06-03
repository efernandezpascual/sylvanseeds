filtrar <- function(df, sp = "Quercus robur") filter(df, Species == sp)

references <- function(df1 = WoSDB, sp = "Quercus robur") {
  filter(df1, TPLName == sp) %>%
    select(Reference) %>%
    unique %>%
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
    geom_point(color = "gold", size = 3, alpha = 0.8) +
    coord_cartesian(xlim = c(-150, 180), ylim = c(-55, 80)) +
    labs(title = "Origin of the germination records.", subtitle = "The golden circles are the coordinates of the seed lots used in the experiments,\n  the green areas the extension of the temperate broadleaf and mixed forest biome.") +
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
    labs(title = "Seed germination records.", subtitle = "Bars are the mean germination proportions,\n brackets the binomial confidence intervals.") +
    ylab(label = "Germination proportion") + xlab(label = "Average germination temperature (C)") +
    theme(text = element_text(size = 12),
          plot.title = element_text(face = c("bold"), size = 14),
          plot.subtitle = element_text(face = c("italic"))) +
    facet_wrap( ~ Experiment, scales = "free", ncol = 4)
}