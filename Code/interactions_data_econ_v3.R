# Turnstiles project
# Tatiana Velascto R
# August 5th, 2019, updated October 8th, 2019


# ---------------------------------------------- #
#    CODING INTERACTIONS BETWEEN ALL CLASSES     #
#       All buildings - Econ students            #
# ---------------------------------------------- #

rm(list = ls())

# Import Libraries
library(foreign)
library(dplyr)
library(doBy)
library(plyr)
library(igraph)
library(hashmap)

# Import functions
# ----------------
# source("adjacency.to.edgelist2.R")
# Function from: https://rdrr.io/github/hangxiong/wNetwork/src/R/adjacency.to.edgelist.R
# set working directory
setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Data/Code")
# setwd("H:/TatiV/The Company you keep/Data/Code")
source("all.full.edgelist.R")

# Set time clock
start_time <- Sys.time() # Start counting time

# set working directory
setwd("/Users/tatianavelasco.ro/Dropbox/TC\ Columbia/Research/Turnstiles/Data/Data_Processing")
# setwd("H:/TatiV/The Company you keep/Data/Data_Processing")

# Open CSV File
mydata <- read.csv("All_Econ2.csv", sep = "," ) # use all data

# Format time variables
mydata$date_time <- strptime(mydata$fecha_completa2, format = '%Y-%m-%d %H:%M:%S')
mydata$porteria_detalle <- as.character(mydata$porteria_detalle)

# gen auxiliary tools
building <- c("AU", "CPM", "Franco", "Lleras", "ML", "Navas", "PB", "SD", "Sports", "W")
# building <- c("AU")


# Todos contra todos
# -------------------

# Create auxiliary tools
edge.list.full.all <- matrix(nrow = 1, ncol = 9, rep(NA))
colnames(edge.list.full.all) <- c("carnet1", "carnet2", "date_time_carnet1", "porteria_det_carnet1", "porteria_det_carnet2", "building", "action", "day", "year")

for (y in 2016:2018) {
  for (b in building) {
    for (a in 0:1) {
      for (w in 1:5)  {
        
        my.data.filtered <- mydata[mydata$anio == y, ]
        my.data.day <- my.data.filtered[my.data.filtered$building==b & my.data.filtered$action_in == a & my.data.filtered$n_diasemana == w, ] 
        edge.list <- all.full.edgelist(my.data.day, building = b, action=a, day=w, year=y)
        edge.list.full.all <- rbind(edge.list.full.all, edge.list)
      }
    }
  }
  
}

edge.list.full.all.csv <- write.csv2(edge.list.full.all, "edge.list.full.all2.csv")

end_time <- Sys.time() # stop counting time
time <- end_time - start_time
time 



# 
# 
# # Rich vs Poor
# # ------------
# 
# # Set time clock
# start_time <- Sys.time() # Start counting time
# 
# # Create auxiliary tools
# edge.list.full.rich.poor <- matrix(nrow = 1, ncol = 7, rep(NA))
# colnames(edge.list.full.rich.poor) <- c("rico_id", "pobre_id", "date_time_rico", "building", "action", "day", "year")
# 
# for (y in 2016:2018) {
#   for (b in building) {
#     for (a in 0:1) {
#          for (w in 1:5)  {
#           
#            my.data.filtered <- mydata[mydata$anio == y, ]
#            my.data.day <- my.data.filtered[my.data.filtered$building==b & my.data.filtered$action_in == a & my.data.filtered$n_diasemana == w, ] 
#            edge.list <- rich.poor.full.edgelist(my.data.day, building = b, action=a, day=w, year=y)
#            edge.list.full.rich.poor <- rbind(edge.list.full.rich.poor, edge.list)
#          }
#        }
#   }
#   
# }
# 
# edge.list.full.rich.poor.csv <- write.csv2(edge.list.full.rich.poor, "edge.list.full.rich.poor.csv")
# 
# end_time <- Sys.time() # stop counting time
# time <- end_time - start_time
# time 
# 
# # Rich vs Middle
# # --------------
# 
# # Set time clock
# start_time <- Sys.time() # Start counting time
# 
# # Create auxiliary tools
# edge.list.full.rich.middle <- matrix(nrow = 1, ncol = 7, rep(NA))
# colnames(edge.list.full.rich.middle) <- c("rico_id", "middle_id", "date_time_rico", "building", "action", "day", "year")
# 
# for (y in 2016:2018) {
#   for (b in building) {
#     for (a in 0:1) {
#       for (w in 1:5)  {
#         
#         my.data.filtered <- mydata[mydata$anio == y, ]
#         my.data.day <- my.data.filtered[my.data.filtered$building==b & my.data.filtered$action_in == a & my.data.filtered$n_diasemana == w, ] 
#         edge.list <- rich.middle.full.edgelist(my.data.day, building = b, action=a, day=w, year=y)
#         edge.list.full.rich.middle <- rbind(edge.list.full.rich.middle, edge.list)
#       }
#     }
#   }
#   
# }
# 
# edge.list.full.rich.middle <- write.csv2(edge.list.full.rich.middle, "edge.list.full.rich.middle.csv")
# 
# end_time <- Sys.time() # stop counting time
# time <- end_time - start_time
# time 
# 
# # Rich vs rich
# # ------------
# # Create auxiliary tools
# edge.list.full.rich.rich <- matrix(nrow = 1, ncol = 7, rep(NA))
# colnames(edge.list.full.rich.rich) <- c("rico_id", "rico_id", "date_time_rico", "building", "action", "day", "year")
# 
# for (y in 2016:2018) {
#   for (b in building) {
#     for (a in 0:1) {
#       for (w in 1:5)  {
#         
#         my.data.filtered <- mydata[mydata$anio == y, ]
#         my.data.day <- my.data.filtered[my.data.filtered$building==b & my.data.filtered$action_in == a & my.data.filtered$n_diasemana == w, ] 
#         edge.list <- rich.rich.full.edgelist(my.data.day, building = b, action=a, day=w, year=y)
#         edge.list.full.rich.rich <- rbind(edge.list.full.rich.rich, edge.list)
#       }
#     }
#   }
#   
# }
# 
# edge.list.full.rich.rich <- write.csv2(edge.list.full.rich.rich, "edge.list.full.rich.rich.csv")
# 
# # Poor vs Middle
# # -------------
# edge.list.full.poor.middle <- matrix(nrow = 1, ncol = 7, rep(NA))
# colnames(edge.list.full.poor.middle) <- c("pobre_id", "middle_id", "date_time_pobre", "building", "action", "day", "year")
# 
# for (y in 2016:2018) {
#   for (b in building) {
#     for (a in 0:1) {
#       for (w in 1:5)  {
#         
#         my.data.filtered <- mydata[mydata$anio == y, ]
#         my.data.day <- my.data.filtered[my.data.filtered$building==b & my.data.filtered$action_in == a & my.data.filtered$n_diasemana == w, ] 
#         edge.list <- poor.middle.full.edgelist(my.data.day, building = b, action=a, day=w, year=y)
#         edge.list.full.poor.middle <- rbind(edge.list.full.poor.middle, edge.list)
#       }
#     }
#   }
#   
# }
# 
# edge.list.full.poor.middle <- write.csv2(edge.list.full.poor.middle, "edge.list.full.poor.middle.csv")
# 
# 
# # Poor vs Poor
# # ----------
# edge.list.full.poor.poor <- matrix(nrow = 1, ncol = 7, rep(NA))
# colnames(edge.list.full.poor.poor) <- c("pobre_id", "pobre_id", "date_time_pobre", "building", "action", "day", "year")
# 
# for (y in 2016:2018) {
#   for (b in building) {
#     for (a in 0:1) {
#       for (w in 1:5)  {
#         
#         my.data.filtered <- mydata[mydata$anio == y, ]
#         my.data.day <- my.data.filtered[my.data.filtered$building==b & my.data.filtered$action_in == a & my.data.filtered$n_diasemana == w, ] 
#         edge.list <- poor.poor.full.edgelist(my.data.day, building = b, action=a, day=w, year=y)
#         edge.list.full.poor.poor <- rbind(edge.list.full.poor.poor, edge.list)
#       }
#     }
#   }
#   
# }
# 
# edge.list.full.poor.poor <- write.csv2(edge.list.full.poor.poor, "edge.list.full.poor.poor.csv")
# 
# # Middle vs Middle
# # ----------------
# edge.list.full.middle.middle <- matrix(nrow = 1, ncol = 7, rep(NA))
# colnames(edge.list.full.middle.middle) <- c("middle_id", "middle_id", "date_time_middle", "building", "action", "day", "year")
# 
# for (y in 2016:2018) {
#   for (b in building) {
#     for (a in 0:1) {
#       for (w in 1:5)  {
#         
#         my.data.filtered <- mydata[mydata$anio == y, ]
#         my.data.day <- my.data.filtered[my.data.filtered$building==b & my.data.filtered$action_in == a & my.data.filtered$n_diasemana == w, ] 
#         edge.list <- middle.middle.full.edgelist(my.data.day, building = b, action=a, day=w, year=y)
#         edge.list.full.middle.middle <- rbind(edge.list.full.middle.middle, edge.list)
#       }
#     }
#   }
#   
# }
# 
# edge.list.full.middle.middle <- write.csv2(edge.list.full.middle.middle, "edge.list.full.middle.middle.csv")
# 
# end_time <- Sys.time() # stop counting time
# time <- end_time - start_time
# time 
