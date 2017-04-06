knitr::knit('index.Rmd', output = 'README.md')
Index <- readLines("README.md")
YML <- grep("---", Index)
Index <- Index[-seq(YML[1], YML[2])]
Index[1] <- "[![DOI](https://zenodo.org/badge/86778696.svg)](https://zenodo.org/badge/latestdoi/86778696)"
writeLines(, "README.md")


