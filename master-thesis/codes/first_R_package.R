# Construction of the first package
# set the working directory to the shared partition
setwd("E:/R/")
# setwd("/windows/R/")
# install.packages("devtools")
library("devtools")
# devtools::install_github("klutometis/roxygen")
library(roxygen2)
# Creation of empty package
create("statanacoseq")
# save function as "E:/R/statanacoseq/R/countcodonfreq.R"
setwd("./statanacoseq")
document()
setwd("..")
install("statanacoseq")
sessionInfo()
detach("package:statanacoseq", unload=TRUE)




