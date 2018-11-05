
fatorial <- function(valor){
  retorno <- 1
  for (x in seq(valor,by = -1)) {
    retorno = retorno * x
  }
  return(retorno)
}

inverte <- function(vetor){
   invertido <-  vector(length = length(vetor))
  a=length(vetor)
  for(x in vetor) {
    invertido[a]  = x;
    a = a-1
  }
  return(invertido)
}

vt <- c(1,2,3,4,5)

invertRec <- function(vt,retorno=0){
  if(length(retorno) != length(vt)){
    retorno[length(retorno)] <- invertRec(vt[-1],retorno)
  }
  return(retorno)
}

invertRec(c(1,2,3,4,5))

acumulado <- function(serietemp,names=NULL,linhas=NULL){
  x=1;
  mes = 0;
  meses <- c(serietemp);
  saida <- data.frame();
  for(ap in serietemp){
    meses[x] <- meses[x]+ mes;
    saida <- rbind(saida,c(x,ap,meses[x]))
    x= x+1;
    mes <- mes+ap;
  }
  colnames(saida) <- names
  return(saida)
}

mtcars$mpg

sum(AirPassengers)

View(acumulado(AirPassengers,c('#','Valor','Acumulado')))
