##
##
##------------------------------------------------------------------------------
##
##
## Preguntas

#Instalando los paquetes para poder procesar necesitamos por ahora los 3 siguentes
install.packages("lubridate")
install.packages("tidyverse")
install.packages("stringr")
install.packages("dplyr")

#Leer el archivo epa http.cvs
library(readr)
library(dplyr)


epa_http <- read_table("epa-http.csv", col_names = FALSE)
#cambiar nombre de los columnas
colnames(epa_http)[1]<-"origen"
colnames(epa_http)[2]<-"dataTimeStamp"
colnames(epa_http)[3]<-"metodoHttp"
colnames(epa_http)[4]<-"uri"
colnames(epa_http)[5]<-"protocolo"
colnames(epa_http)[6]<-"respuestaHttp"
colnames(epa_http)[7]<-"bytes"
#View(epa_http)


## Listar la segunda columna en formato de fecha

#Columna 2 convertir a formato fecha
epa_http$dataTimeStamp <- as.POSIXct(epa_http$dataTimeStamp,format="[%d:%H:%M:%S]",tz = "utc")  

#Define 0 si es NA
epa_http$bytes <-  epa_http$bytes <- ifelse(is.na(epa_http$bytes), 0, epa_http$bytes)
#Convierte los valores a numerico
epa_http$bytes <-  as.numeric(epa_http$bytes)


#Primera pregunta 1  Cuales son las dimensiones del dataset cargado (número de filas y columnas)
dim(epa_http)

#Primera pregunta  Valor medio de la columna Bytes
mean(epa_http$bytes)


## Pregunta 2
var <-   stringr::str_like(epa_http$origen,"%.edu%", ignore_case = TRUE)
contador_true <- sum(var)
contador_true

#Pregunta 2 otra forma

var <- grepl(".edu", epa_http$origen, ignore.case = TRUE)
conteo <- sum(var)
print(conteo)

#Pregunta 3

epa_http$metodoHttp <- gsub('^"|"$', '', epa_http$metodoHttp)
epa_http$protocolo <- gsub('^"|"$', '', epa_http$protocolo)
# Obtengo los resultados agrupados por Fecha-Hora y ordenados por cantidad de peticiones de mayor a menor
epa_http$dataTimeStamp <- as.POSIXct(epa_http$dataTimeStamp, format="%Y-%m-%d %H:%M:%S")
epa_http <- epa_http %>%  mutate(timestamp_agrupado = format(dataTimeStamp, "%Y-%m-%d %H:00:00"))

# Agrupar por la nueva columna y contar las peticiones GET
resultados <- epa_http %>% filter(metodoHttp == "GET") %>% group_by(timestamp_agrupado) %>%  summarise(cantidad_peticiones = n())

# Imprimir los resultados
resultados <- resultados %>% 
  arrange(desc(cantidad_peticiones))
print(resultados, n = nrow(resultados))


#Pregunta 4

View(epa_http)
p4  <- epa_http[grepl(".edu", epa_http$origen),]
View(p4)
unique(p4$origen)
p4 <- p4[grepl(".txt$", p4$uri),]
c4 <- sum(p4$bytes)
c4
View(p4)

#Pregunta 4 segunda opcion
View(epa_http)
p42  <- dplyr::select(epa_http,origen)
p42
p42  <- dplyr::filter(epa_http,stringr::str_like(origen,"%edu$%",ignore_case = TRUE))
View(p42)
p42 <- p42[grepl(".txt$", p42$uri),]
c4 <- sum(p42$bytes)
c4
View(p42)


#Pregunta 5
p5  <- dplyr::filter(epa_http,stringr::str_like(uri,"/",ignore_case = TRUE))
n5 <- count(p5)
n5
View(p5)


#Pregunta 6
p6  <- dplyr::filter(epa_http,!stringr::str_like(protocolo,"%HTTP/0.2%",ignore_case = TRUE))
n6Tot <- count(epa_http)
n6Diff <- count(p6)

print(as.numeric(n6Tot) - as.numeric(n6Diff))

dim(p6)
dim(epa_http)