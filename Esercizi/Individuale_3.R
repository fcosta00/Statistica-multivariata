#Una volta verificato che la semplice esposizione alle informazioni disponibili in tv e sul web ha una scarsa influenza su quanto le persone sanno 
#relativamente alla pandemia da Covid-19, si vuole verificare se un training sistematico di una settimana con esperti di statistica e virologia possa migliorare la conoscenza che le persone hanno relativamente alla pandemia.
#Dal campione testato nella ricerca precedente, vengono estratti causalmente 40 partecipanti (indipendentemente dal fatto che siano informati o non informati).
#Il database Training_inf.xlsx (disponibile su Moodle), contiene i punteggi al PCAI prima (tempo 1) e dopo (tempo 2) il training.

#1) Importare il dataset e convertire la variabile tempo in categoriale.

setwd("C:/Users/franc/OneDrive - Università degli Studi di Padova/Università-PC-senzaMilza/Magistrale/Statistica multivariata/Esercizi")

library(readxl)
training <- read_excel("Data/Training_inf.xlsx")

str(training)

training$Tempo <- as.factor( training$Tempo)

#2) Creare un vettore (nome Delta_score) che contenga le differenze di punteggio per ciascun soggetto: punteggio dopo il training -  punteggio prima del training.
#notate che il vettore non deve essere aggiunto al dataset.

Delta_score <- training[ training$Tempo == 2, ]$Score - training[ training$Tempo == 1, ]$Score

#3) Creare un qqplot per ispezionare visivamente la normalit?/non normalit? della distribuzione delle differenze di punteggio (commentare i risultati).

ggplot(data.frame(Delta_score), aes(x=Delta_score)) +
  geom_density(colour="lightgreen", fill= 'lightgreen', size=1) +
  geom_histogram( aes(y=..density..), fill= 'darkgreen', binwidth=0.5, alpha = 0.9) +
  labs(title="Istogramma con Curva di Densità",
       x="Valori",
       y="Densità") +
  theme_minimal()


#4) Applicate un test di Shapiro-Wilk per avere informazioni pi? precise sulla distribuzione delle differenze di punteggio (commentare i risultati).


#5) Utilizzando la funzione pwr.t.test(), verificare se il numero di soggetti testati ? sufficente per avere una potenza di .80, ipotizzando un effect size (d di Cohen) di 0.5 (commentare i risultati).

#6) Utilizzando un barplot, rappresentare i punteggi medi al PCAI (con errore standard) al tempo 1 e al tempo 2 (occorre fare riferimento al dataset importato Training_inf.xlsx).

#7) Eseguire il t-test appropriato per verificare se il training ha aumentato i punteggi al PCAI. Commentare i risultati.

#8) Calcolare l'effect size (r di Pearson) associato al risultato.

