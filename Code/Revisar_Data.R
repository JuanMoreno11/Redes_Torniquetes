# Nov 20th, 2019
# Generate file w/student-term access
# Code by: Tatiana Velasco

  # ------------------------------------------ #
  # DESCRIPTIVE STATS REVISING TURNSTILES DATA #
  # ------------------------------------------ #
rm(list = ls())

#install.packages("bigreadr")

#Load Libraries
library(tidyverse)
library(bigreadr)

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes_TRT/Data/P2000")


# Count students per term and include their number of actions
# -----------------------------------------------------------

files <- list.files("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes_TRT/Data/P2000")
files <- files[-c(1,2,3,4)] # Make sure this is the list of subsets of data only

tempdata <- matrix(nrow = 1, ncol = 4)
colnames(tempdata) <- c("ID_ESTUDIANTE", "anio", "semester", "actions")

# Loop over subsets
for(filename in files) {
  
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,]
  mydata <- mydata[,c("V1", "V2", "V3", "V9", "V10")]
  colnames(mydata) <- c("PROGRAMA_ESTUDIANTE", "ID_ESTUDIANTE", "torniquete", "anio", "n_mes" )
  mydata$n_mes <- as.numeric(mydata$n_mes)
  mydata$semester <- ifelse(mydata$n_mes>=1 & mydata$n_mes<=5, 1,
                         ifelse(mydata$n_mes>=8 & mydata$n_mes<=11, 2, NA))

  mydata$one <- 1
  mydata.freqs <- aggregate(mydata$one ~ mydata$ID_ESTUDIANTE + mydata$anio + mydata$semester, FUN = sum)
  colnames(mydata.freqs)
  colnames(mydata.freqs) <- c("ID_ESTUDIANTE", "anio", "semester", "actions")
  tempdata <- rbind(tempdata, mydata.freqs)
  
}

# Then, aggregate temp data by ID, year, semester, to make sure I'm not double counting duplicates
freqs.studs.terms <- aggregate(tempdata$actions ~  tempdata$ID_ESTUDIANTE + tempdata$anio + tempdata$semester, FUN = sum)

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes_TRT/Data/data_processing")
freqs.studs.terms <- write.csv(freqs.studs.terms, file = "freqs.studs.terms.csv", sep = ";")

