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
install.packages("dplyr")

#Leer el archivo epa http.cvs
library(readr)
epa_http <- read_table("epa-http.csv", col_names = FALSE)
#cambiar nombre de los columnas
colnames(epa_http)[1]<-"origen"
colnames(epa_http)[2]<-"dataTimeStamp"
colnames(epa_http)[3]<-"metodoHttp"
colnames(epa_http)[4]<-"uri"
colnames(epa_http)[5]<-"protocolo"
colnames(epa_http)[6]<-"respuestaHttp"
colnames(epa_http)[7]<-"bytes"
View(epa_http)

#Ver el tipo de dato de la variable epa http
#class(epa_http)

## Listar la segunda columna en formato de fecha



#Columna 2 convertir a formato fecha
epa_http$dataTimeStamp <- as.POSIXct(epa_http$dataTimeStamp,format="[%d:%H:%M:%S]",tz = "utc")  

#Define 0 si es NA
epa_http$bytes <-  epa_http$bytes <- ifelse(is.na(epa_http$bytes), 0, epa_http$bytes)
#Convierte los valores a numerico
epa_http$bytes <-  as.numeric(epa_http$bytes)


#Primera pregunta 1
dim(epa_http)

#Segunda pregunta calcular el promedio
mean(epa_http$bytes)


## Pregunta 1
var <-   stringr::str_like(epa_http$origen,"%.edu%", ignore_case = TRUE)
contador_true <- sum(var)
contador_true

#Pregunta 1.2

var <- grepl(".edu$", epa_http$origen, ignore.case = TRUE)
conteo <- sum(var)
print(conteo)


#Pregunta 4

var <-   stringr::str_like(epa_http$origen,"%.edu%", ignore_case = TRUE)
var

View(epa_http)
p4  <- epa_http[grepl(".edu$", epa_http$origen),]
View(p4)
unique(p4$origen)
p4 <- p4[grepl(".txt$", p4$uri),]
sum(p4$uri)
View(p4)

#Pregunta 4 segunda opcion
View(epa_http)
p42  <- dplyr::select(epa_http,origen)
p42
p42  <- dplyr::filter(epa_http,stringr::str_like(origen,"%edu$%",ignore_case = TRUE))
View(p42)
p42 <- p42[grepl(".txt$", p42$uri),]
View(p42)


#Pregunta 5
