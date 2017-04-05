knitr::knit('index.Rmd', output = 'README.md')
Index <- readLines("README.md")
YML <- grep("---", Index)
writeLines(Index[-seq(YML[1], YML[2])], "README.md")
