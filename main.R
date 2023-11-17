#Primer checkout
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


library(readr)
epa_http <- read_table("epa-http.csv", col_names = FALSE)
View(epa_http)


