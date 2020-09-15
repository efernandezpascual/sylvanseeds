README.md
================

![SylvanSeeds](data/2017070313%20Blue%20Ridge%20Parkway%20small.jpg)

# SylvanSeeds, a seed germination database for temperate deciduous forests

[*SylvanSeeds*](https://efernandezpascual.github.io/home/sylvanseeds.html)
is a dataset of seed germination ecology for the temperate broadleaf and
mixed forest biome of the northern hemisphere. It contains data on \>300
plant species, obtained from \>500 published references. The data is in
the form of germination proportions recorded under experimental
combinations of temperature, light, scarification and stratification.

This repository stores all the information related to the publication
*SylvanSeeds, a seed germination database for temperate deciduous
forests*, including the raw datasets, the scripts to perform data
cleaning and analysis, and the `Rmarkdown` files to create the
manuscript. It also stores the code of the *SylvanSeeds* `shiny` app,
that can be used to visualize the database.

## Contents

This repository is organised following the advice of [Wilson et
al. 2017](https://doi.org/10.1371/journal.pcbi.1005510) for recording
and storing research projects.

The following materials are available in this repository:

  - `data` Original raw files including the primary result of the search
    in the Web of Science, and search notes.
  - `doc` Files to create the manuscript using `Rmarkdown`.
  - `results` Output of the `R` scripts, including the clean database
    and files needed to create the manuscript.
  - `src` Scripts in `R` language used to clean the raw data, perform
    the analyses of the manuscript, and build the `SylvanSeeds` app.

## Citation

Please cite `SylvanSeeds` as:

> Fernández-Pascual, E (2020) SylvanSeeds, a seed germination database
> for temperate deciduous forests. Journal of Vegetation Science, in
> press.
