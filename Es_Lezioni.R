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


# Esercizio 2 - punto 1 -------

library(ggplot2)
hist_s <- ggplot(DOCwashing, aes(x=Score)) + geom_histogram() #la distribuzione si mostra divisa in due pseudo normali appaiate, per cui bimodale

hist_s <- ggplot(DOCwashing, aes(x=Score)) + geom_histogram(binwidth=0.5)

hist_s <- hist_s + 
          theme(axis.text.x = element_text(color="red"),  # Cambia colore etichette asse x
                axis.text.y = element_text(color="blue")) +
          labs(x='Score', y='Frequenza')

hist_s <- hist_s +
          scale_x_continuous(breaks = seq(0, 20, by = 2)) + #cambio i ticks e la frequenza degli assi
          scale_y_continuous(breaks = seq(0, 20, by = 2))
          
hist_s



# Esercizio 2 - punto 2 ------

x <- DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,] #se si vuole estrarre il vettore prima, io non l'ho utilizzato ma ho fatto direttamente

hist_s <- ggplot(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,], aes(x=Score)) + geom_histogram(binwidth=0.5)

hist_0 <- ggplot(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,], aes(x=Score)) + 
        geom_histogram(binwidth=0.5, fill="#98F5FF", color='black', linetype="dashed") +
        scale_x_continuous(breaks = seq(0, 20, by = 2)) + #cambio i ticks e la frequenza degli assi
        scale_y_continuous(breaks = seq(0, 20, by = 2)) +
        labs(x='Score', y='Frequenza') + 
        theme_minimal()

hist_1 <- ggplot(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 0,], aes(x=Score)) + 
        geom_histogram(binwidth=0.5, fill="#98F5FF", color='black', linetype="dashed") +
        scale_x_continuous(breaks = seq(0, 20, by = 2)) + #cambio i ticks e la frequenza degli assi
        scale_y_continuous(breaks = seq(0, 20, by = 2)) +
        labs(x='Score', y='Frequenza') + 
        theme_minimal()
        


# Esercizio 2 - punto 3 -----

qqnorm(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,]$Score  )
qqline(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,]$Score, col="red")

library(pastecs)
stat.desc(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,]$Score, norm= TRUE) #sono distribuiti normalmente

shapiro.test(DOCwashing[DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 1,]$Score) #sono distribuiti normalmente


# Per farlo con tutti i gruppi si può utilizzare il comando by
by( DOCwashing$Score, INDICES = list(DOCwashing$Gruppo, DOCwashing$Tempo), FUN = stat.desc, norm = TRUE)
by( DOCwashing$Score, INDICES = list(DOCwashing$Gruppo, DOCwashing$Tempo), FUN = shapiro.test)

hist_total <- ggplot(DOCwashing, aes(x=Score)) + 
  geom_histogram(binwidth=0.5, fill="#98F5FF", color='black', linetype="dashed") +
  scale_x_continuous(breaks = seq(0, 20, by = 2)) + #cambio i ticks e la frequenza degli assi
  scale_y_continuous(breaks = seq(0, 20, by = 2)) +
  labs(x='Score', y='Frequenza') + 
  facet_grid(DOCwashing$Gruppo ~ DOCwashing$Tempo ) +
  theme_minimal()

# Esercizio 3 - punot 1 ----

IQR(DOCwashing[ DOCwashing$Tempo == 2 & DOCwashing$Gruppo == 1,]$Score)
summary(DOCwashing[ DOCwashing$Tempo == 2 & DOCwashing$Gruppo == 1,]$Score)

by( DOCwashing$Score, INDICES = list(DOCwashing$Gruppo, DOCwashing$Tempo), FUN = mean)
by( DOCwashing$Score, INDICES = list(DOCwashing$Gruppo, DOCwashing$Tempo), FUN = sd)

by( DOCwashing$Score, INDICES = DOCwashing$Genere, FUN = var)

library(plotrix)
std.error(DOCwashing[ DOCwashing$Tempo == 1 & DOCwashing$Gruppo == 0,]$Score)

