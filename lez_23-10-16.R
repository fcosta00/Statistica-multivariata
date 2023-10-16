# Importazione dataset in excell --------

setwd("C:/Users/franc/OneDrive - Università degli Studi di Padova/Università-PC-senzaMilza/Magistrale/Statistica multivariata")

library(readxl)
DOCwashing <- read_excel("Dataframe/DOCwashing.xlsx")

# Esercizio 1 - punto 1 --------

str(DOCwashing)

DOCwashing$ID <- as.factor(DOCwashing$ID)
DOCwashing$Gruppo <- as.factor(DOCwashing$Gruppo)
DOCwashing$Genere <- as.factor(DOCwashing$Genere)
DOCwashing$Tempo <- as.factor(DOCwashing$Tempo)

table(DOCwashing$Gruppo)/2 # /2 perchè ci sono due righe per ogni soggetto, per cui i soggetti effettivi sono la metà dato il sampling in due tempi diversi
table(DOCwashing$Genere)/2
table(DOCwashing$Tempo)

table(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,]$Score)
table(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 0,]$Score)


# Esercizio 1 - punto 2 -----

table(DOCwashing[DOCwashing$Tempo == 1, c(2,3)]) 
table(DOCwashing[, c(4,5)]) # versione meno complicata ->  table(DOCwashing$Tempo, DOCwashing$Score])
table(DOCwashing[DOCwashing$Gruppo == 1, c(4,5)])

