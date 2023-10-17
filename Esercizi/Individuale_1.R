#Un ricercatore del DPG sta conducendo una ricerca sulla relazione tra dipendenze e tratti di personalit?.
#Nello specifico, il ricercatore vuole verificare se esiste una relazione tra tipo di dipendenza (da Alcol, da Cocaina, o da Gioco d'azzardo)...
#e il tratto di personalit? "Aperura all'esperienza". La tabella Pers.xlsx contiene i dati provenienti da un SERT della provincia di Padova.
#In essa sono riportate tre variabili: il codice identificativo del soggetto (ID), il tipo di dipendenza (Tipo_dipendenza)...
#...e il punteggio sulla scala "Apertura all'esperienza" del questionario NEO-FFI (ApEsp).

#Visto che il ricercatore non sa utilizzare RStudio, aiutatelo ad eseguire le seguenti operazioni:

#1) Importare il file Pers.xlsx.

setwd("C:/Users/franc/OneDrive - Università degli Studi di Padova/Università-PC-senzaMilza/Magistrale/Statistica multivariata/Esercizi")

library(readxl)
Pers <- read_excel("Data/Pers.xlsx")


#2) Usando la funzione sum(), contare quanti sono i soggetti del campione dipendenti da Alcol, quanti sono quelli dipendenti da Cocaina, e quanti sono dipendenti dal gioco. 

sum(Pers$Tipo_dipendenza == 'Alcol')
sum(Pers$Tipo_dipendenza == 'Cocaina')
sum(Pers$Tipo_dipendenza == 'Azzardo')

#3) Identificare quali sono i soggetti che abusano di Alcol

Pers[Pers$Tipo_dipendenza == 'Alcol',]$ID

#4) Usando la funzione sum(), contare quanti soggetti che abusano di Alcol hanno un punteggio maggiore di 30. Ripetere la stessa operazione anche per abuso di Cocaina e gioco.

sum(Pers$Tipo_dipendenza == 'Alcol' & Pers$ApEsp > 30)
sum(Pers$Tipo_dipendenza == 'Cocaina' & Pers$ApEsp > 30)
sum(Pers$Tipo_dipendenza == 'Azzardo' & Pers$ApEsp > 30)

#5) Creare un nuovo vettore chiamato ApEsp_mod, contenente la radice quadrata dei punteggi. 

ApEsp_mod <- sqrt(Pers$ApEsp)

#6) Dopo aver verificato attraverso la funzione length() che il vettore ApEsp_mod ha lo stesso numero di elementi degli altri vettori contenuti nel dataframe, aggiungere il vettore al dataframe.

length(ApEsp_mod) == NROW(Pers)

#7) Creare e visualizzare un nuovo vettore di nome Dip_high (che non deve essere aggiunto al data frame) contenente il tipo di dipendenza dei soggetti con un punteggio maggiore di 30.

Dip_high <- Pers[Pers$ApEsp > 30, ]$Tipo_dipendenza

#8) Utilizzare la funzione sum() per contare quanti sono i soggetti con dipendenza da Alcol con un punteggio uguale a 30.

sum(Dip_high == 'Alcol')

#9)  Utilizzare la funzione sum() per contare quanti sono i soggetti con dipendenza da Alcol o da Cocaina con un punteggio minore di 20.

sum( (Pers$Tipo_dipendenza == 'Alcol' | Pers$Tipo_dipendenza == 'Cocaina') & Pers$ApEsp < 20)

#10)  Creare e visualizzare un oggetto di nome perc_alcol_high che corrisponda alla percentuale, di pazienti con dipendenza da Alcol e punteggio maggiore di 30 (sul totale dei pz con dipendenza da Alcol).

perc_alcol_high <- (  sum(Pers$Tipo_dipendenza == 'Alcol' & Pers$ApEsp > 30) / sum(Pers$Tipo_dipendenza == 'Alcol')  )

#11) Ripetere la stessa operazione per i pazienti con dipendenza da gioco, chiamando l'oggetto perc_gioco_high

perc_gioco_high <- (  sum(Pers$Tipo_dipendenza == 'Azzardo' & Pers$ApEsp > 30) / sum(Pers$Tipo_dipendenza == 'Azzardo')  )

#12) Visualizzare il rapporto tra le percentuali sopra calcolate.

perc_alcol_high/perc_gioco_high
