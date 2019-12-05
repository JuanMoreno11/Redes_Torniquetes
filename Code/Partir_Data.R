# Dec 3rd, 2019
## Code by: Tatiana Velasco

  # -------------------------------------------- #
  # PARTIR TURNSTILES DATA EN PEDAZOS MANEJABLES #
  #             PARTIR POR SEMESTRE              #
  # -------------------------------------------- #

rm(list = ls())

#Load Libraries
library(tidyverse)
library(bigreadr)
library(lubridate)

# Prepare work space
# ------------------

# Ubicacion de la base original en pedazos:
original <- c("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes\ SPP\ y\ Redes/Data/Source/Torniquetes")
# Ubicacion donde se guardan los archivos por meses:
mensual <- c("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Torniquetes_TRT/Data/P2000")


files <- list.files(original)
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


## Generate files one month a the time
## -----------------------------------

# Loop over subsets: enero
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
 # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  enero <- rbind(enero, mydata[mydata$mesn == 1,])
 
}

setwd(mensual)
enero.csv <- write.csv(enero, file = "enero.csv")
rm(enero, enero.csv)

# Loop over subsets: febrero
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  febrero <- rbind(febrero, mydata[mydata$mesn == 2,])
  
}

setwd(mensual)
febrero.csv <- write.csv(febrero, file = "febrero.csv")
rm(febrero, febrero.csv)

# Loop over subsets: marzo
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  marzo <- rbind(marzo, mydata[mydata$mesn == 3,])
  
}

setwd(mensual)
marzo.csv <- write.csv(marzo, file = "marzo.csv")
rm(marzo, marzo.csv)

# Loop over subsets: abril
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  abril <- rbind(abril, mydata[mydata$mesn == 4,])
  
}

setwd(mensual)
abril.csv <- write.csv(abril, file = "abril.csv")
rm(abril, abril.csv)

# Loop over subsets: mayo
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  mayo <- rbind(mayo, mydata[mydata$mesn == 5,])
  
}

setwd(mensual)
mayo.csv <- write.csv(mayo, file = "mayo.csv")
rm(mayo, mayo.csv)

# Loop over subsets: junio
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  junio <- rbind(junio, mydata[mydata$mesn == 6,])
  
}

setwd(mensual)
junio.csv <- write.csv(junio, file = "junio.csv")
rm(junio, junio.csv)

# Loop over subsets: julio
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  julio <- rbind(julio, mydata[mydata$mesn == 7,])
  
}

setwd(mensual)
julio.csv <- write.csv(julio, file = "julio.csv")
rm(julio, julio.csv)

# Loop over subsets: agosto
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  agosto <- rbind(agosto, mydata[mydata$mesn == 8,])
  
}

setwd(mensual)
agosto.csv <- write.csv(agosto, file = "agosto.csv")
rm(agosto, agosto.csv)

# Loop over subsets: septiembre
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  septiembre <- rbind(septiembre, mydata[mydata$mesn == 9,])
  
}

setwd(mensual)
septiembre.csv <- write.csv(septiembre, file = "septiembre.csv")
rm(septiembre, septiembre.csv)

# Loop over subsets: octubre
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  octubre <- rbind(octubre, mydata[mydata$mesn == 10,])
  
}

setwd(mensual)
octubre.csv <- write.csv(octubre, file = "octubre.csv")
rm(octubre, octubre.csv)

# Loop over subsets: noviembre
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  noviembre <- rbind(noviembre, mydata[mydata$mesn == 11,])
  
}

setwd(mensual)
noviembre.csv <- write.csv(noviembre, file = "noviembre.csv")
rm(noviembre, noviembre.csv)

# Loop over subsets: diciembre
for(filename in files) {
  
  setwd(original)
  mydata <- read.csv(filename, sep = ";", header = FALSE)
  mydata <- mydata[-1,] # quito la primera fila de cada archivo
  # mydata <- mydata[1:5000,] ## PARA HACER PRUEBAS
  
  colnames(mydata) <- c("programa", "carnet", "torniquete", "edificio", "porteria", "accion", "modo", "fecha_completa", "dia_semana", "dia", "NA", "jornada")
  mydata$carnet <- substr(as.character(mydata$carnet), 1, 9)
  mydata$fecha <- as.POSIXct(mydata$fecha_completa, format = '%Y.%m.%d')
  mydata$mesn <- month(mydata$fecha)
  diciembre <- rbind(diciembre, mydata[mydata$mesn == 12,])
  
}

setwd(mensual)
diciembre.csv <- write.csv(diciembre, file = "diciembre.csv")
rm(diciembre, diciembre.csv)





unique <- mydata[!duplicated(mydata$carnet, mydata$torniquete, mydata$fecha_completa),]



