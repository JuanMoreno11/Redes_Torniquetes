# Dec 3rd, 2019
# Generate file w/student-term access
# Code by: Tatiana Velasco

  # -------------------------------------------- #
  # PARTIR TURNSTILES DATA EN PEDAZOS MANEJABLES #
  #             PARTIR POR SEMESTRE              #
  # -------------------------------------------- #

rm(list = ls())

#install.packages("bigreadr")

#Load Libraries
library(tidyverse)
library(bigreadr)
library(lubridate)

# Count students per term and include their number of actions
# -----------------------------------------------------------
setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")

files <- list.files("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
files <- files[-c(1)] # Make sure this is the list of subsets of data only

# Preparar tablas limpias
enero <- matrix(nrow = 1, ncol = 14)
febrero <- matrix(nrow = 1, ncol = 14)
marzo <- matrix(nrow = 1, ncol = 14)
abril <- matrix(nrow = 1, ncol = 14)
mayo <- matrix(nrow = 1, ncol = 14)
junio <- matrix(nrow = 1, ncol = 14)
julio <- matrix(nrow = 1, ncol = 14)
agosto <- matrix(nrow = 1, ncol = 14)
septiembre <- matrix(nrow = 1, ncol = 14)
octubre <- matrix(nrow = 1, ncol = 14)
noviembre <- matrix(nrow = 1, ncol = 14)
diciembre <- matrix(nrow = 1, ncol = 14)

colnames(enero) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(febrero) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(marzo) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(abril) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(mayo) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(junio) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(julio) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(agosto) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(septiembre) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(octubre) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(noviembre) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")
colnames(diciembre) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada", "fecha", "mesn")



# Loop over subsets: enero
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
 # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  enero <- rbind(enero, mydata[mydata$mesn == 1,])
 
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
enero.csv <- write.csv(enero, file = "enero.csv")


# Loop over subsets: febrero
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  febrero <- rbind(febrero, mydata[mydata$mesn == 2,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
febrero.csv <- write.csv(febrero, file = "febrero.csv")

# Loop over subsets: marzo
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  marzo <- rbind(marzo, mydata[mydata$mesn == 3,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
marzo.csv <- write.csv(marzo, file = "marzo.csv")

# Loop over subsets: abril
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  abril <- rbind(abril, mydata[mydata$mesn == 4,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
abril.csv <- write.csv(abril, file = "abril.csv")

# Loop over subsets: mayo
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  mayo <- rbind(mayo, mydata[mydata$mesn == 5,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
mayo.csv <- write.csv(mayo, file = "mayo.csv")

# Loop over subsets: junio
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  junio <- rbind(junio, mydata[mydata$mesn == 6,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
junio.csv <- write.csv(junio, file = "junio.csv")

# Loop over subsets: julio
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  julio <- rbind(julio, mydata[mydata$mesn == 7,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
julio.csv <- write.csv(julio, file = "julio.csv")

# Loop over subsets: agosto
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  agosto <- rbind(agosto, mydata[mydata$mesn == 8,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
agosto.csv <- write.csv(agosto, file = "agosto.csv")

# Loop over subsets: septiembre
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  septiembre <- rbind(septiembre, mydata[mydata$mesn == 9,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
septiembre.csv <- write.csv(septiembre, file = "septiembre.csv")

# Loop over subsets: octubre
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  octubre <- rbind(octubre, mydata[mydata$mesn == 10,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
octubre.csv <- write.csv(octubre, file = "octubre.csv")

# Loop over subsets: noviembre
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  noviembre <- rbind(noviembre, mydata[mydata$mesn == 11,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
noviembre.csv <- write.csv(noviembre, file = "noviembre.csv")

# Loop over subsets: diciembre
for(filename in files) {
  
  setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  diciembre <- rbind(diciembre, mydata[mydata$mesn == 12,])
  
}

setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Data_Processing")
diciembre.csv <- write.csv(diciembre, file = "diciembre.csv")








