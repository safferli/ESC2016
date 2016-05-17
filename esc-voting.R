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
# ## if doesn't exist, pull data from DWD
# if(file.exists("dwd.Rdata")){
#   load("dwd.Rdata")
# } else {
#   dta <- f.get.dwd.data()
#   save(dta, file = "dwd.Rdata")
# }

# drops the televote points column for some reason
# library(readxl)
#esc.2016 <- read_excel("data/ESC-2016-grand_final-full_results.xls", skip = 1)

# convert to csv first, then clean \n characters (I hate Excel...)
esc.2016 <- read_csv("data/ESC-2016-grand_final-full_results.csv") %>% 
  # rename column names to clean R standards
  setNames(make.names(names(.))) %>% 
  mutate(
    # clean up NA to zeros
    Jury.Points = ifelse(is.na(Jury.Points), 0, Jury.Points),
    Televote.Points = ifelse(is.na(Televote.Points), 0, Televote.Points),
    # get total points as sum of Jury and Televote
    Total.Points = Jury.Points + Televote.Points, 
    jury.vote.difference = Televote.Points - Jury.Points
  )




# http://wol.iza.org/articles/gravity-models-tool-for-migration-analysis/long

