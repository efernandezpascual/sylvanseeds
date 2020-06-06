Sylvan Seeds, a database and web app to explore the seed germination
ecology of temperate broadleaf and mixed forests of the northern
hemisphere
================

# Abstract

*Motivation* Seed traits have functional significance in all levels of
plant ecology, from population dynamics to community assembly and
species distribution models. Recent discussions on the utility of seed
traits in ecology have highlighted the unavailability of reliable
germination databases of wide geographical scope. This data paper
presents a first global dataset of raw germination data, encompassing an
ecologically and biogeographically coherent unit: the Temperate
Broadleaf and Mixed Forests biome of the northern hemisphere. Data were
gathered using a systematic literature search approach.

*Main types of variable contained* Proportion of seeds germinated in
laboratory experiments, under different experimental combinations of
scarification, stratification, light or darkness, and constant or
alternating germination temperatures.

*Spatial location and grain* Seed lots collected throughout the biome
and in neighbouring areas, with approximate geographical coordinates of
the collecting sites.

*Time period and grain* Seed lots collected between 1920 and 2017.

*Major taxa and level of measurement* 326 plant species with high
frequency in vegetation relevés of the biome, representing 74 families
of seed plants (gymnosperms and angiosperms).

*Software format* The database is provided as a single *.csv* file. The
shiny web app *Sylvan Seeds* is also presented, to explore the database
and make it accessible to the wider public.

# Keywords

Temperate deciduous forests, temperate evergreen forests, temperate
coniferous forests, seed traits, germination database, seed dormancy,
germination temperature, alternating temperatures, light germination,
dark germination

# Introduction

Seed traits have functional significance in all levels of plant ecology,
from population dynamics (Huang *et al.*, [2016](#ref-RN3043)) to
community assembly (Larson & Funk, [2016](#ref-RN2942)) and species
distributions (Larson & Funk, [2016](#ref-RN2942)). Recent discussions
(Jiménez-Alfaro *et al.*, [2016](#ref-RN2352); Saatkamp *et al.*,
[2019](#ref-RN4655)) highlighted the unavailability of reliable
germination databases of wide geographical scope as a major limitation
to produce a global synthesis of the seed ecological spectrum. Seed
germination is the first major developmental transition in the life of a
plant, and as such it has profound effects on the plant’s ecology
(Donohue *et al.*, [2010](#ref-RN2384)). As such, the timing of this
transition is controlled by a combination of environmental signals.
Amongst these are temperature (Fernández-Pascual *et al.*,
[2019](#ref-RN2249)), diurnal temperature alternation (Thompson *et
al.*, [1977](#ref-RN2217)), light (Carta *et al.*, [2017](#ref-RN4656))
and seed dormancy inductors and relievers (Finch-Savage &
Leubner-Metzger, [2006](#ref-RN3063)). All of these signals interact to
produce a coarse- and fine-scale regulation of germination timing,
integrating inputs from both seasonal climatic cycles (Jurado & Flores,
[2005](#ref-RN3132)) and local environmental gradients
(Fernández-Pascual *et al.*, [2017](#ref-RN2865)). The practical
consequence of this is that the response of seeds to, for example, light
will depend on other conditions set by the experimenter. This makes it
difficult to summarise germination “traits” into a single value in a way
comparable to seed mass, specific leaf area or plant height
(Pérez-Harguindeguy *et al.*, [2013](#ref-RN2923)), and may explain the
lack of global germination databases. Germination compilations with a
biogeographical background, of which the prime example today is the
cornerstone book of Baskin and Baskin ([2014](#ref-RN3214)), only
provide summary information, for instance the interpreted optimal
germination temperature instead of the proportion of seeds germinated
across a temperature gradient.

To fill this gap, this data paper presents a first global dataset of raw
germination data for an ecologically and biogeographically coherent
unit: the Temperate Broadleaf and Mixed Forests biome of the northern
hemisphere (*TBMFNH*). The building of the dataset was part of a
research project conducted within the *sPlot* initiative (Bruelheide *et
al.*, [2019](#ref-RN4658)), specifically *sPlot*’s project \#12
(<https://www.idiv.de/en/sdiv/working_groups/wg_pool/splot/projects.html>).
The goal of *sPlot* \#12 was to study taxonomical and functional plant
diversity in deciduous forests, which are dominant in temperate
latitudes with mild to cold winters and relatively warm and wet summers.
In the northern hemisphere, they also form a coherent evolutionary and
biogeographic unit, sharing a common Tertiary history until they became
separated between North America, Asia and Europe (Milne & Abbott,
[2002](#ref-RN4684)). At the same time, a relatively high number of
classic seed biology research groups have worked within the *TBMFNH*
areas, e.g. in the USA (Baskin, [1995](#ref-RN1045)), the UK (Grime *et
al.*, [1981](#ref-RN3273)), Belgium (Van Assche & Vandelook,
[2006](#ref-RN656)) and Japan (Washitani, [1988](#ref-RN1188)). For this
reason, *sPlot* project \#12 was chosen to incorporate a biome-wide
analysis of seed traits, as it was expected that the *TBMFNH* would
provide a wide scope of available data. To gather data for the project,
a systematic literature search (Koricheva *et al.*, [2013](#ref-RN2401))
was applied to a list of frequent species representing the flora of the
*TBMFNH*. This data paper makes the database accessible to the research
community. Additionally, the *Sylvan Seeds* shiny web app is presented
to facilitate the exploration of the data.

# Methods

## Species list

A list of species for which to search germination data was created using
vegetation relevés (i.e. records of plant species co-occurring in
sampling plots) from *sPlot* (Bruelheide *et al.*, [2019](#ref-RN4658)).
The terrestrial regionalization of the *World Wildlife Fund* (Olson *et
al.*, [2001](#ref-RN4667)) was used to select plots according to their
coordinates. To ensure that plots were a representative sample of
*TBMFNH* biodiversity, they were chosen from 20 ecoregions distributed
throughout the northern hemisphere: 17 ecoregions of the Temperate
Broadleaf and Mixed Forests biome (*Appalachian mixed mesophytic
forests*, *Atlantic mixed forests*, *Cantabrian mixed forests*, *Caspian
Hyrcanian mixed forests*, *Central Korean deciduous forests*, *Dinaric
Mountains mixed forests*, *Euxine-Colchic broadleaf forests*, *Hokkaido
deciduous forests*, *Manchurian mixed forests*, *Nihonkai evergreen
forests*, *Nihonkai montane deciduous forests*, *Pindus Mountains mixed
forests*, *Southeastern mixed forests*, *Taiheiyo evergreen forests*,
*Taiheiyo montane deciduous forests*, *Western European broadleaf
forests*, *Western Great Lakes forests*), plus three neighbouring
ecoregions of the Temperate Coniferous Forest biome (*Cascade Mountains
leeward forests*, *Central and Southern Cascades forests*, *Eastern
Cascades forests*). Although temperate broadleaf and mixed forests also
occur in a smaller area of the southern hemisphere, these southern
forests form a separate evolutionary and biogeographical unit, not being
related by a common history like the northern hemisphere ones (Milne &
Abbott, [2002](#ref-RN4684)). For this reason, they were not considered.
All chosen relevés had been classified as forest plots by *sPlot*,
i.e. their plant cover was dominated by tree species. The taxa names
were standardized to species level with *The Plant List*
([2013](#ref-RN2321)) using the *Taxonstand* package (Cayuela *et al.*,
[2019](#ref-RN4660)) in *R* version 3.6.2 (Team, [2019](#ref-RN2315)).
The final vegetation database contained 17,852 relevés and 7,684
standardized species names, considering only seed plants (gymnosperms
and angiosperms), and encompassing all forest layers. To obtain the
final list of species, only species that were present in at least 5% of
the relevés of an ecoregion were kept, rendering a list of 1,391
frequent species. There were two reasons to use this frequency
threshold: (i) it made the search achievable with the resources
available; and (ii) it filtered out rare species that may not be
representative of *TBMFNH*, and which could have been recorded for a
variety of reasons (wrong taxonomical identifications, mistakes in plot
coordinates, border areas, unnatural areas such as parks, etc.). The
result is a list of plant species that occur with relatively high
frequency in forest plots of the *TBMFNH*; this includes trees, shrubs
and shade-tolerant forbs and grasses, as well as common semi-open
species from forest margins, secondary forests, ruderalized forest
plots, etc.

## Web of Science literature search

The list of frequent species (plus the synonyms recorded in the relevés)
was incorporated into a Boolean search string, together with the words
“(seed OR seeds) AND (dormancy OR germination)” (**Supplementary
material 1**). This string was searched in the *Thompson Reuters Web of
Science* on 5 Mar 2019, returning 6,791 results. The processing of these
results is described in a PRISMA flow diagram (**Supplementary material
2**). A first filter of the results by the relevance of the title
retained 1,489 references. An effort was made to access the full text of
all these references, using in order the following channels: (i) “Find
Full Text” functionality in *EndNote X9*, (ii) online access to the
journals using the institutional subscriptions of the University of
Oviedo; (iiI) request to the authors through *ResearchGate*; (iv)
general search of *pdf* files in *Google* using the article details.
Unfortunately, 236 references could not be accessed. Most of these
belonged to smaller publishers not included in the subscriptions of the
University of Oviedo, and to older journal volumes which had not been
digitalised. The resources of this project did not make it possible to
further pursue these references, but they are included as a *BibTeX*
file (**Supplementary material 3**) in case they can be processed in the
future. The found texts were accessed to retrieve data for the database.
At this stage, references were considered to be non-relevant if they (i)
did not pertain to species in the original frequent species list; (ii)
did not study germination in species monocultures (e.g. competition
studies); (iii) did not report the minimal information needed (number of
seeds sown, germination percentage and germination temperature). Records
were also excluded when they pertained to special germination treatments
that do not allow for general comparisons (i.e. use of germination
promoters such as the plant hormone gibberellic acid; drought
treatments, including polyethylene glycol solutions; application of
heavy metals or other pollutants; smoke-related germination promoters
such as karrikins). Of the accessed references, 639 were non-relevant
(*BiBTeX* file in **Supplementary material 4**) and 614 provided
relevant data (*BiBTeX* file in **Supplementary material 5**).

## Recording of the database

For each relevant reference, three blocks of information were recorded.
The first block described the plant material, including the species, the
populations that had been sampled, the year of sampling (or the year of
publication if that information was missing), the country, the
geographical coordinates (if not provided in the reference, the closest
available toponyms were searched in *Google Maps*; in some cases the
only geographical information was the country, in these cases the
coordinates of the capital were recorded). The second block described
the experimental conditions: experimental setting (greenhouse, incubator
or room temperature), germination substrate and characteristics of the
containers, seed storage, application of seed sterilization or
nutrients, length of the germination incubations, use of stratification
(none, cold \[\< 15ºC\], warm \[\>= 15ºC\] or combinations of cold and
warm), use of scarification, photoperiod, maximum germination
temperature, minimum germination temperature, and weighted average
germination temperature. The third block contained the final germination
proportion: the reported final germination percentages (retrieved from
the text, tables or figures) and the reported number of replicates and
seeds per replicate were used to calculate a count of seeds sown and a
count of seeds germinated.

# Description of the database

## Summary of contents

The final database contains 4,828 records (germination proportions for a
given seed lot of a species, recorded in a set of experimental
conditions) from 614 references. The plant materials had been collected
across the Temperate Broadleaf and Mixed Forest biome and surrounding
areas (**Fig. @ref(fig:fig1)**) in both hemispheres. The oldest record
was from 1,920 and the top three contributing countries were the USA
(1,357), the UK (591) and Japan (531). There were 364 species
represented, from 74 seed plant families. The total estimate of seeds
used in the experiments was 953,807. The range of germination
temperatures (weighted average of the daily thermoperiod) went from -4
to 43 ºC, with 2,107 records of constant temperatures and 2,721 of
alternating temperatures. Light was used in 2,849 records, darkness in
1,227 and 752 did not provide information on this parameter. The
experiments were performed with unstratified seeds in 3,227 records, and
of the rest, the majority (1,421) went through cold stratification.
Scarification was applied to 252 records.

## Database file

The database is provided as a *csv* file, comma separated, named
**Supplementary material 6 - Database** (see online supplementary
materials). The first row of the file contains the header data, with the
following variables: *Taxon* (the original species names, as used in the
references), *TPLName* (*The Plant List* species names), *Family* (the
botanical family of the species), *Reference* (bibliographic source of
the record), *Year* (year the seed lot was collected), *Country*
(country where the seed lot was collected), *Population* (geographical
information of the seed lot), *Latitude* (approximated latitude where
the seed lot was collected, in decimal degrees), *Longitude*
(approximated longitude where the seed lot was collected, in decimal
degrees), *Dry\_storage* (binary variable indicating whether the seed
lot was kept at dry storage for more than a month between seed
collection and start of the experiments), *Setting* (environs used to
control germination temperature: either a greenhouse, a
climatically-controlled incubator, or room temperature), *Sterilization*
(note on surface sterilization treatments applied to the seed lot before
the experiments), *Nutrients* (note on nutrient application to the
germination substrate), *Substrate* (substrate used to hold the seeds
during the germination incubation), *Container\_type* (type of container
used to hold the substrate and the seeds during the experiments),
*Container\_size* (dimensions of the germination containers),
*Container\_number* (number of germination containers used for the
treatment), *Sown\_by\_container* (number of seeds sown in each
container), *Incubation\_days* (number of days between the start of the
experiment, not including stratification, and the day when germinated
seeds were counted), *Scarification* (binary variable indicating whether
the seed lot was scarified before the test), *Stratification\_days*
(number of days the seed lot was exposed to any type of stratification,
before the test), *Stratification\_temperature* (temperature or
temperatures used during the stratification treatment, in degrees
Celsius), *Stratification\_type* (type of stratification, which can be
none, cold, warm or combinations of cold and warm), *Stratification*
(binary variable indicating whether the seed lot was stratified or not
before the test), *Light* (binary variable indicating whether the seed
lot was germinated in light or in darkness), *Photoperiod* (number of
hours of exposure to light in the daily photoperiod), *Alternating*
(binary variable indicating whether the germination test was conducted
under constant or alternating temperatures), *Tdif* (difference in
degrees between the hottest and the coldest temperatures of the daily
thermoperiod), *Tmax* (hottest temperature in the daily thermoperiod),
*Tmin* (coldest temperature in the daily thermoperiod), *Tmean* (mean
germination temperature, weighted by the length of each phase of the
daily thermoperiod), *Temperature* (aggregation of the mean germination
temperature in 5 ºC intervals), *Germinated* (count of seeds that
germinated during the experiment), *Germinable* (count of seeds used in
the experiment). Each row below the header represents a record for a
seed lot germinated in a given set of experimental conditions.

# Sylvan Seeds app

To facilitate the visualization of the database, the *Sylvan Seeds* app
was written using the *shiny* package (Chang *et al.*,
[2020](#ref-RN4661)). It is publicly accessible at
<http://sylvanseeds.shinyapps.io/sylvanseeds/>. The app uses the
*tidyverse* package (Wickham *et al.*, [2019](#ref-RN4662)) to aggregate
and show results for species and experimental treatments
(i.e. aggregating all seed lots of the same species germinated in the
same experimental conditions). To facilitate comparisons, germination
temperatures are aggregated to 5 ºC intervals. When there is only one
seed lot per species and combination of experimental conditions, the
binomial 95% confidence interval is calculated using the Wilson method
in the *binom* package (Dorai-Raj, [2014](#ref-RN2964)). When there is
more than one seed lot per species and combination of experimental
conditions, the aggregate proportion and binomial confidence intervals
are calculated using binomial-normal meta-analysis models (Stijnen *et
al.*, [2010](#ref-RN4663)) as implemented in the package *metaphor*
(Viechtbauer, [2010](#ref-RN2274)). By visiting the app, users can
consult the available germination information for a species (**Fig.
@ref(fig:fig2)**), the origin of its seed lots, and the bibliographical
references for the species.

# Utility of the database

The database provided in this article, and the web app to visualize it,
can have wide applicability in science and beyond. The data can extend
current trends in global analyses of plant traits at species (Díaz *et
al.*, [2016](#ref-RN3318)) and community levels (Bruelheide *et al.*,
[2018](#ref-RN4664)) to seed germination. The ecological determinants of
seed germination are also valuable information for species distribution
models (Bykova *et al.*, [2012](#ref-RN3078)). The visualization of the
database with the *Sylvan Seeds* app can help plant ecologists select
experimental treatments that are adequate for their experiments (Baskin
*et al.*, [2006](#ref-RN2999)). Outside of academia, the data is useful
for seed industries (De Vitis *et al.*, [2017](#ref-RN4665)),
restoration practitioners (Ladouceur *et al.*, [2018](#ref-RN2241)) and
the implementation of regional schemes for seed-based landscape
intervention (Jiménez-Alfaro *et al.*, [2020](#ref-RN4666)). The app is
accessible to citizens in general who are interested in germinating wild
plants. Finally, apart from the dataset itself, this article can bring
two innovations to the seed ecology community, helping to advance the
agenda of functional seed ecology (Saatkamp *et al.*,
[2019](#ref-RN4655)). First, the meta-analysis-inspired methodology used
to compile the dataset can be extended to other biomes and lists of
species, contributing to the creation of a global database for
ecologically and biogeographically coherent floras. Second, the database
and the app can serve as a standard in further efforts to compile and
standardize seed germination data.

# References

<div id="refs">

<div id="ref-RN3214">

Baskin, C.C. & Baskin, J.M. (2014) *Seeds. Ecology, Biogeography and
Evolution of Dormancy and Germination. Second Edition*, Academic Press,
San Diego.

</div>

<div id="ref-RN2999">

Baskin, C.C., Thompson, K. & Baskin, J.M. (2006) Mistakes in germination
ecology and how to avoid them. *Seed Science Research*, **16**, 165–168.

</div>

<div id="ref-RN1045">

Baskin, S.E.B., Carol C.; Meyer (1995) Two types of morphophysiological
dormancy in seeds of two genera (*Osmorhiza* and *Erythronium*) with an
Arcto-Tertiary distribution pattern. *American Journal of Botany*,
**82**, 293–298.

</div>

<div id="ref-RN4658">

Bruelheide, H., Dengler, J., Jiménez‐Alfaro, B., Purschke, O.,
Hennekens, S.M., Chytrý, M., Pillar, V.D., Jansen, F., Kattge, J. &
Sandel, B. (2019) sPlot–A new tool for global vegetation analyses.
*Journal of Vegetation Science*, **30**, 161–186.

</div>

<div id="ref-RN4664">

Bruelheide, H., Dengler, J., Purschke, O., Lenoir, J., Jiménez-Alfaro,
B., Hennekens, S.M., Botta-Dukát, Z., Chytrý, M., Field, R. & Jansen, F.
(2018) Global trait–environment relationships of plant communities.
*Nature Ecology & Evolution*, **2**, 1906–1917.

</div>

<div id="ref-RN3078">

Bykova, O., Chuine, I., Morin, X. & Higgins, S.I. (2012) Temperature
dependence of the reproduction niche and its relevance for plant species
distributions. *Journal of Biogeography*, **39**, 2191–2200.

</div>

<div id="ref-RN4656">

Carta, A., Skourti, E., Mattana, E., Vandelook, F. & Thanos, C.A. (2017)
Photoinhibition of seed germination: occurrence, ecology and phylogeny.
*Seed Science Research*, **27**, 131–153.

</div>

<div id="ref-RN4660">

Cayuela, L., Stein, A. & Oksanen, J. (2019) Taxonstand: taxonomic
standardization of plant species names. R package version 2.2.

</div>

<div id="ref-RN4661">

Chang, W., Cheng, J., Allaire, J., Xie, Y. & Mcpherson, J. (2020) shiny:
web application framework for R. R Package Version 1.4.0.2.

</div>

<div id="ref-RN4665">

De Vitis, M., Abbandonato, H., Dixon, K.W., Laverack, G., Bonomi, C. &
Pedrini, S. (2017) The European native seed industry: characterization
and perspectives in grassland restoration. *Sustainability*, **9**,
1682.

</div>

<div id="ref-RN3318">

Díaz, S., Kattge, J., Cornelissen, J.H.C., Wright, I.J., Lavorel, S.,
Dray, S., Reu, B., Kleyer, M., Wirth, C., Colin Prentice, I., Garnier,
E., Bönisch, G., Westoby, M., Poorter, H., Reich, P.B., Moles, A.T.,
Dickie, J., Gillison, A.N., Zanne, A.E., Chave, J., Joseph Wright, S.,
Sheremet’ev, S.N., Jactel, H., Baraloto, C., Cerabolini, B., Pierce, S.,
Shipley, B., Kirkup, D., Casanoves, F., Joswig, J.S., Günther, A.,
Falczuk, V., Rüger, N., Mahecha, M.D. & Gorné, L.D. (2016) The global
spectrum of plant form and function. *Nature*, **529**, 167–171.

</div>

<div id="ref-RN2384">

Donohue, K., Rubio de Casas, R., Burghardt, L., Kovach, K. & Willis,
C.G. (2010) Germination, postgermination adaptation, and species
ecological ranges. *Annual Review of Ecology, Evolution, and
Systematics*, **41**, 293–319.

</div>

<div id="ref-RN2964">

Dorai-Raj, S. (2014) binom: binomial confidence intervals for several
parameterizations. R package version 1.1-1.

</div>

<div id="ref-RN2249">

Fernández-Pascual, E., Mattana, E. & Pritchard, H.W. (2019) Seeds of
future past: climate change and the thermal memory of plant reproductive
traits. *Biological Reviews*, **94**, 439–456.

</div>

<div id="ref-RN2865">

Fernández-Pascual, E., Pérez-Arcoiza, A., Prieto, J.A. & Díaz, T.E.
(2017) Environmental filtering drives the shape and breadth of the seed
germination niche in coastal plant communities. *Annals of Botany*,
**119**, 1169–1177.

</div>

<div id="ref-RN3063">

Finch-Savage, W.E. & Leubner-Metzger, G. (2006) Seed dormancy and the
control of germination. *New Phytologist*, **171**, 501–523.

</div>

<div id="ref-RN3273">

Grime, J.P., Mason, G., Curtis, A.V., Rodman, J., Band, S.R., Mowforth,
M.A.G., Neal, A.M. & Shaw, S. (1981) A comparative study of germination
characteristics in a local flora. *Journal of Ecology*, **69**,
1017–1059.

</div>

<div id="ref-RN3043">

Huang, Z., Liu, S., Bradford, K.J., Huxman, T.E. & Venable, D.L. (2016)
The contribution of germination functional traits to population dynamics
of a desert plant community. *Ecology*, **97**, 250–261.

</div>

<div id="ref-RN4666">

Jiménez-Alfaro, B., Frischie, S., Stolz, J. & Gálvez-Ramírez, C. (2020)
Native plants for greening Mediterranean agroecosystems. *Nature
Plants*, **6**, 209–214.

</div>

<div id="ref-RN2352">

Jiménez-Alfaro, B., Silveira, F.A.O., Fidelis, A., Poschlod, P. &
Commander, L.E. (2016) Seed germination traits can contribute better to
plant community ecology. *Journal of Vegetation Science*, **27**,
637–645.

</div>

<div id="ref-RN3132">

Jurado, E. & Flores, J. (2005) Is seed dormancy under environmental
control or bound to plant traits? *Journal of Vegetation Science*,
**16**, 559–564.

</div>

<div id="ref-RN2401">

Koricheva, J., Gurevitch, J. & Mengersen, K.L. (2013) *Handbook of
Meta-Analysis in Ecology and Evolution*, Princeton University Press.

</div>

<div id="ref-RN2241">

Ladouceur, E., Jiménez-Alfaro, B., Marin, M., De Vitis, M., Abbandonato,
H., Iannetta, P.P.M., Bonomi, C. & Pritchard, H.W. (2018) Native seed
supply and the restoration species pool. *Conservation Letters*, **11**,
e12381–e12381.

</div>

<div id="ref-RN2942">

Larson, J.E. & Funk, J.L. (2016) Regeneration: an overlooked aspect of
trait‐based plant community assembly models. *Journal of Ecology*,
**104**, 1284–1298.

</div>

<div id="ref-RN2321">

List, T.P. (2013) Version 1.1.

</div>

<div id="ref-RN4684">

Milne, R.I. & Abbott, R.J. (2002) The origin and evolution of tertiary
relict floras. *Advances in Botanical Research*, **38**, 281–314.

</div>

<div id="ref-RN4667">

Olson, D.M., Dinerstein, E., Wikramanayake, E.D., Burgess, N.D., Powell,
G.V., Underwood, E.C., D’amico, J.A., Itoua, I., Strand, H.E. &
Morrison, J.C. (2001) Terrestrial Ecoregions of the World: A New Map of
Life on Earth: A new global map of terrestrial ecoregions provides an
innovative tool for conserving biodiversity. *BioScience*, **51**,
933–938.

</div>

<div id="ref-RN2923">

Pérez-Harguindeguy, N., Díaz, S., Garnier, É., Lavorel, S., Poorter, H.,
Jaureguiberry, P., Bret-Harte, M., Cornwell, W.K., Craine, J. & Gurvich,
D. (2013) New handbook for standardised measurement of plant functional
traits worldwide. *Australian Journal of Botany*, **61**, 167–234.

</div>

<div id="ref-RN4655">

Saatkamp, A., Cochrane, A., Commander, L., Guja, L.K., Jimenez‐Alfaro,
B., Larson, J., Nicotra, A., Poschlod, P., Silveira, F.A. & Cross, A.T.
(2019) A research agenda for seed‐trait functional ecology. *New
Phytologist*, **221**, 1764–1775.

</div>

<div id="ref-RN4663">

Stijnen, T., Hamza, T.H. & Özdemir, P. (2010) Random effects
meta‐analysis of event outcome in the framework of the generalized
linear mixed model with applications in sparse data. *Statistics in
medicine*, **29**, 3046–3067.

</div>

<div id="ref-RN2315">

Team, R.C. (2019) R: A language and environment for statistical
computing.

</div>

<div id="ref-RN2217">

Thompson, J.P., Mason, G.K. & Grime (1977) Seed germination in response
to diurnal fluctuations of temperature. *Nature*, **267**, 147–149.

</div>

<div id="ref-RN656">

Van Assche, J.A. & Vandelook, F.E.A. (2006) Germination ecology of
eleven species of Geraniaceae and Malvaceae, with special reference to
the effects of drying seeds. *Seed Science Research*, **16**, 283–290.

</div>

<div id="ref-RN2274">

Viechtbauer, W. (2010) Conducting meta-analyses in R with the metafor
package. *Journal of Statistical Software*, **36**, 1–48.

</div>

<div id="ref-RN1188">

Washitani, I. (1988) Effects of high temperatures on the permeability
and germinability of the hard seeds of Rhus javanica L. *Annals of
Botany*, **62**, 13–16.

</div>

<div id="ref-RN4662">

Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L., François,
R., Grolemund, G., Hayes, A., Henry, L. & Hester, J. (2019) Welcome to
the Tidyverse. *Journal of Open Source Software*, **4**, 1686.

</div>

</div>

# Data accessibility statement

All persons can use the database providing they cite this data paper
properly in any publications or in the metadata of any derived products
that are produced using the database. The database is provided as
supplementary material and will be stored in *Dryad*. It can be
visualized with the *Sylvan Seeds* app at
<http://sylvanseeds.shinyapps.io/sylvanseeds/>. The code of the app is
stored at (note: the GitHub page is kept private until publication of
the manuscript).

# Figures

<div class="figure" style="text-align: center">

<img src="last_files/figure-gfm/fig1-1.png" alt="Geographical distribution of the germination records in the database. Each golden circle is a record. The green areas correspond to the extension of the Temperate Broadleaf and Mixed Forests biome according to the *WWF*."  />

<p class="caption">

Geographical distribution of the germination records in the database.
Each golden circle is a record. The green areas correspond to the
extension of the Temperate Broadleaf and Mixed Forests biome according
to the *WWF*.

</p>

</div>

<div class="figure" style="text-align: center">

<img src="last_files/figure-gfm/fig2-1.png" alt="Example of the germination records as shown by the *Sylvan Seeds* app. Records for one species, the European pedunculate oak, *Quercus robur*. Each panel shows the results for a combination of experimental conditions, with the germination temperature varying within each panel. Bars represent the mean germination proportion and brackets the 95% binomial confidence interval."  />

<p class="caption">

Example of the germination records as shown by the *Sylvan Seeds* app.
Records for one species, the European pedunculate oak, *Quercus robur*.
Each panel shows the results for a combination of experimental
conditions, with the germination temperature varying within each panel.
Bars represent the mean germination proportion and brackets the 95%
binomial confidence interval.

</p>

</div>
