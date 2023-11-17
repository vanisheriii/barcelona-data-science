#Primer checkout

## Algunos comandos basicos para poder manejar
"Hola Mundo"
HolaMundo <- "Hola Mundo 2"
HolaMundo

vara <- "Hola"
varb <- 1:100
print(varb)
for (i in 1:length(varb)){
  aux <- paste(vara,varb[i], sep = "")
  print(aux)
}

m1  <- matrix(1:12,ncol = 3,nrow = 4) #matrix
m1

m1[2,]
m1[4,]
m1[3,]


d1 <- data.frame(Columna1 =  c(1,3,5,7,9),
                 Columna2 =  c("a","b","c","d","F"),
                 Columna3 =  c(TRUE,FALSE,TRUE,TRUE,TRUE),
                 stringsAsFactors  = TRUE)

d1
## Apply apical functions a un array o array

myFunction <- function(){
  print("MiFuncion")
}
##
##
##------------------------------------------------------------------------------
##
## Desde aca empieza los cambios para poder consumir el archivo epa-http.csv este ya se encuentra en el repositorio

#Instalando los paquetes para poder procesar necesitamos por ahora los 3 siguentes
install.packages("lubridate")
install.packages("tidyverse")
install.packages("stringr")

#Leer el archivo epa http.cvs
library(readr)
epa_http <- read_table("epa-http.csv", col_names = FALSE)
#Ver el archivo
View(epa_http)

#Ver el tipo de dato de la variable epa http
class(epa_http)

## Listar la segunda columna en formato de fecha



#Columna 2 
epa_http$X2 <- as.POSIXct(epa_http$X2,format="[%d:%H:%M:%S]",tz = "utc")  
#Define 0 si es NA
epa_http$X7 <-  epa_http$X7 <- ifelse(is.na(epa_http$X7), 0, epa_http$X7)
#Convierte los valores a numerico
epa_http$X7 <-  as.numeric(epa_http$X7)
#Calcular la media de la columna 7
mean(epa_http$X7)
min(epa_http$X7)
max(epa_http$X7)
#cambiar nombre de los columnas
colnames(epa_http)
colnames(epa_http)[1]<-"origen"
colnames(epa_http)[2]<-"dataTimeStamp"
colnames(epa_http)[3]<-"metodoHttp"
colnames(epa_http)[4]<-"uri"
colnames(epa_http)[5]<-"protocolo"
colnames(epa_http)[6]<-"respuestaHttp"
colnames(epa_http)[7]<-"bytes"
View(epa_http)

## Pregunta 2 
var <- stringr::str_like(epa_http$Origen,"%edu", ignore_case = TRUE)
var

#Primera pregunta
dim(epa_http)


