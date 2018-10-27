
BrFlights2$Companhia.Aerea <- as.factor(BrFlights2$Companhia.Aerea )
BrFlights2$Codigo.Tipo.Linha <- as.factor(BrFlights2$Codigo.Tipo.Linha )
BrFlights2$Situacao.Voo <- as.factor(BrFlights2$Situacao.Voo )
BrFlights2$Aeroporto.Origem <- as.factor(BrFlights2$Aeroporto.Origem )
BrFlights2$Aeroporto.Destino <- as.factor(BrFlights2$Aeroporto.Destino )
BrFlights2$Pais.Origem <- as.factor(BrFlights2$Pais.Origem )
BrFlights2$Pais.Destino <- as.factor(BrFlights2$Pais.Destino )


BrFlights2$Atraso_chegada <- BrFlights2$Chegada.Prevista - BrFlights2$Chegada.Real

BrFlights2$Atraso_partida<- BrFlights2$Partida.Prevista - BrFlights2$Partida.Real

dist_eucli_LAT <- (BrFlights2$LatOrig - BrFlights2$LatDest)^2
dist_eucli_LON <- (BrFlights2$LongOrig - BrFlights2$LongDest)^2


BrFlights2$DistanciaEuclidiana <- sqrt(dist_eucli_LAT + dist_eucli_LON)

viagemDt <- BrFlights2$Partida.Real - BrFlights2$Chegada.Real

summary(as.numeric(atraso_partida))

summary(BrFlights2)

?aggregate(BrFlights2$Atraso_partida,
          by = list( BrFlights2$Companhia.Aerea),
          FUN = mean,  na.rm = TRUE ) -> totais
totais[tail(order(totais$x), 5),]
