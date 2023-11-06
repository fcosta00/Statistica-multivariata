#Un gruppo di ricerca sta studiando la relazione tra Disturbo da Deficit di Attenzione e Iperattivit? (DDAI, o ADHD) e abuso di sostanze.
#Da un'analisi della letteratura, emerge che le persone affette da ADHD hanno una probabilit? pi? alta, rispetto a persone non affette da questo disturbo,
#di presentare in et? adulta un Disturbo da Abuso di Sostanze. Il gruppo di ricerca vuole testare se la relazione tra i due disturbi (ADHD e Abuso di sostanze) ? mediata dal fatto di frequentare "cattive compagnie".
#In altre parole, i ricercatori vogliono verificare se il motivo reale per il quale gli ADHD presentano pi? spesso dei controlli un disturbo da abuso di sostanze ? imputabile al fatto che
#gli ADHD hanno una probabilit? maggiore, rispetto ai controlli, di entrare in "cattive compagnie" che li portano ad entrare in contatto con le sostanze stupefacenti.

#Per testare questa ipotesi, vengono selezionati un campione di persone con ADHD e un campione di persone senza ADHD (controlli).
#Ciascun partecipante deve riportare se, in adolescenza, ha frequentato o meno "cattive compagnie".
#Per ciascun soggetto viene misurata la gravit? dei comportamenti legati ad abuso di sostanze, attraverso una misura su scala ordinale da 1 a 100 (denominata Score).
#I dati della ricerca sono contenuti nel database ADHD_sostanze.xlsx, scaricabile da Moodle.

#Eseguire le seguenti operazioni (ricordarsi di convertire in variabili categoriali Gruppo e Cattive_compagnie):

setwd("C:/Users/franc/OneDrive - Università degli Studi di Padova/Università-PC-senzaMilza/Magistrale/Statistica multivariata/Esercizi")

library(readxl)
adhd <- read_excel("Data/ADHD_sostanze.xlsx")

str(adhd)

adhd$Gruppo <- as.factor(adhd$Gruppo)
adhd$Cattive_compagnie <- as.factor(adhd$Cattive_compagnie)

str(adhd)

#Costruire una tavola di frequenza per le variabili Gruppo e Cattive_compagnie (considerate assieme).

table( list(adhd$Gruppo, adhd$Cattive_compagnie) )

#Utilizzando istogrammi (in ggplot2), valutare e commentare la forma della distribuzione di Score, per ciascuna delle quattro combinazioni delle variabili Gruppo e Cattive_compagnie.
#Eventualmente, utilizzare la funzione facet.grid() per rappresentare tutti e quattro i grafici "in un colpo solo".


library(ggplot2)

ggplot(adhd, aes(x = Score)) +
  geom_histogram(binwidth = 2, fill = "#98F5FF", color = "black") +
  facet_grid(Gruppo ~ Cattive_compagnie) +
  labs(
    title = "Distribuzione di Score per Gruppo e Cattive_compagnie",
    x = "Score",
    y = "Conteggio"
  ) +
  theme_minimal()


#Valutare la forma della distribuzione di Score, per ciascuna delle quattro combinazioni delle variabili Gruppo e Cattive_compagnie,
#utilizzando sia i test numerici che il test di Shapiro-Wilk. Eventualmente, utilizzare la funzione by(), o in combinazione con la funzione stat.desc(), oppure da sola (come preferite).

library(pastecs)

by( adhd$Score, INDICES = list(adhd$Gruppo, adhd$Cattive_compagnie), FUN = stat.desc, norm = TRUE)
by( adhd$Score, INDICES = list(adhd$Gruppo, adhd$Cattive_compagnie), FUN = shapiro.test)


#Costruite un grafico (con ggplot2) per rappresentare i dati. Scegliete il tipo di grafico che preferite con le impostazioni grafiche che preferite. 

ggplot(adhd, aes(x= Cattive_compagnie:Gruppo, y=Score, fill = Gruppo)) + 
  ggdist::stat_halfeye(aes(color = Gruppo, fill = Gruppo, alpha = 0.5),
                       adjust = .6,
                       width = 1,
                       .width = 0) + 
  geom_boxplot(width=0.5) +
  labs(title="Boxplot score divisi per categorie",
       y="Score Disturbo Abuso sostanze",
       x="Gruppo e cattive compagnie") +
  theme_minimal() +
  guides(alpha = "none") 
