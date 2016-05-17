rm(list = ls()); gc(); gc()
# options(java.parameters = "-Xmx8192m")
# options(java.parameters = "-XX:-UseConcMarkSweepGC")
# options(java.parameters = "-XX:-UseGCOverheadLimit")
options(bitmapType='cairo')
options(scipen = 999)

library(readr)
library(dplyr)
library(ggplot2)

wd <- "D:/github/ESC2016"
setwd(wd)


## load data from disk
## if doesn't exist, pull data from DWD
if(file.exists("dwd.Rdata")){
  load("dwd.Rdata")
} else {
  dta <- f.get.dwd.data()
  save(dta, file = "dwd.Rdata")
}