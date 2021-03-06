README.md
================

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4081377.svg)](https://doi.org/10.5281/zenodo.4081377)

![SylvanSeeds](2017070313%20Blue%20Ridge%20Parkway%20small.jpg)

# SylvanSeeds, a seed germination database for temperate deciduous forests

[*SylvanSeeds*](https://efernandezpascual.github.io/home/sylvanseeds.html)
is a database of seed germination ecology for the temperate broadleaf
and mixed forest biome of the northern hemisphere. It contains data on
\>300 plant species, obtained from \>500 published references. The data
is in the form of germination proportions recorded under experimental
combinations of temperature, light, scarification and stratification.

This repository stores all the information related to the publication
[*SylvanSeeds, a seed germination database for temperate deciduous
forests*](https://doi.org/10.1111/jvs.12960), including the raw
datasets, the scripts to perform data cleaning and analysis, and the
`Rmarkdown` files to create the
[manuscript](https://github.com/efernandezpascual/sylvanseeds/blob/master/doc/manuscript.md).
It also stores the code of the *SylvanSeeds* `shiny` app, that can be
used to visualize the database.

## Contents

This repository is organised following the advice of [Wilson et
al. 2017](https://doi.org/10.1371/journal.pcbi.1005510) for recording
and storing research projects.

The following materials are available in this repository:

  - `data` Primary data files including the SylvanSeeds database in csv
    format and Boolean search string used in the Web of Science.
  - `doc` Files to create the
    [manuscript](https://github.com/efernandezpascual/sylvanseeds/blob/master/doc/manuscript.md)
    using `Rmarkdown`.
  - `results` Output of the `R` scripts, including files needed to
    create the manuscript and run the app.
  - `src` Scripts in `R` language used to clean data, perform analyses,
    and build the `SylvanSeeds` app data.

## Citation

Please cite `SylvanSeeds` as:

> Fernández-Pascual E (2021) [SylvanSeeds, a seed germination database
> for temperate deciduous forests.](https://doi.org/10.1111/jvs.12960)
> *Journal of Vegetation Science* 32, e12960.
