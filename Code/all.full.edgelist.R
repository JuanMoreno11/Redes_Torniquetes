
# Interactions All students
# -------------------------

all.full.edgelist <- function(my.data.filtered, building, action, day, year) {

# create vector of richs' actions
all1 <- my.data.filtered[,c("carnet", "date_time", "porteria_detalle")]
all1 <-all1[order(all1$date_time),] #By sorting the data it is faster to check the interactions
# create vector of poors' actions
all2 <- all1

# Create list of interactions w/time_date
auxPobresStartIndex <- 1 # Auxiliary variable to keep comparaisons at minimum # esto es lo que mas velocidad gana
minSeconds <- 2 #The number of seconds to consider an interaction
edg <- matrix(nrow = 1, ncol = 5, rep(NA))

# crear aqui una lista de 3 celdas y una linea, a esa lista le pego nuevos valores en a funcion, ya no necesitaria el hashmap 
# Recorre los ricos y para los pobres recorre solo las interacciones posibles
for (i in 1:nrow(all1)) { #Ricos are in the rows#
  updatedIndex <- FALSE
  for (j in auxPobresStartIndex:nrow(all2)) { #Pobres are in the columns # 
  
  if(all1$carnet[i]!=all2$carnet[j]) { # Look at different students only #
   timediff<- as.numeric(difftime(all1$date_time[i], all2$date_time[j], units = "secs"))
  
     if(abs(timediff) < minSeconds){  
       row <- c(all1$carnet[i], all2$carnet[j], as.character(all1$date_time[i]), as.character(all1$porteria_detalle[i]), as.character(all2$porteria_detalle[j]) )
       edg <- rbind(edg, row)
       
       if(!updatedIndex){
         auxPobresStartIndex <- j
         updatedIndex <- TRUE
       }
     }
      if(timediff < -minSeconds){
        break;
      }
      if(!updatedIndex)
       auxPobresStartIndex <-j
  }
  }  
}


colnames(edg) <- c("carnet1", "carnet2", "date_time_carnet1", "porteria_det_carnet1", "porteria_det_carnet2")
edg <- cbind(edg, building, action, day, year)
edg <- edg[-1,]
return(edg)

}
