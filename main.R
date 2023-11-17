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

## Listar la segunda columna
epa_http[,2]



epa_http$X2

