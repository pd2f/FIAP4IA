# limpar memória do R
rm(list=ls(all=TRUE))


# mostrar até 2 casas decimais
options("scipen" = 2)
 

# Ler arquivo csv

paises <- read.csv("C:/Users/logonrmlocal/Documents/paulofranco/FIAP4IA/DADOS_Papercsv_1.csv", row.names=1, sep=";")
fix(paises)

#Verificando o formato das variáveis
str(paises)

#Estatísticas descritivas
summary(paises)


mean(paises$p100ms) # média

median(paises$p100ms) # mediana

quantile(paises$p100ms,type=4)  # Quartis

quantile(paises$p100ms,.65,type=4) # exato percentil

quantile(paises$p100ms,seq(.01,.99,.01))


range(paises$p100ms)  # amplitude

diff(range(paises$p100ms)) #diferença entre o maior e o menor valor

min(paises$p100ms)  # valor mínimo de x

max(paises$p100ms)  # valor máximo de x

var(paises$p100ms) # para obter a variância

sd(paises$p100ms)  # para obter o desvio padrão

CV_p100ms<-sd(paises$p100ms)/mean(paises$p100ms)*100  # para obter o coeficiente de variação
CV_p100ms

CV_p200ms<-sd(paises$p200ms)/mean(paises$p200ms)*100  
CV_p200ms

CV_p800mm<-sd(paises$p800mm)/mean(paises$p800mm)*100  
CV_p800mm


par (mfrow=c(1,2))
hist(paises$p100ms)
boxplot(paises$p100ms)
par (mfrow=c(1,1))




#comando para gerar em 4 linhas e duas colunas os histogramas
par (mfrow=c(4,2))

hist(paises$p100ms)
hist(paises$p200ms)
hist(paises$p400ms)
hist(paises$p800mm)
hist(paises$p1500mm)
hist(paises$p3000mm)
hist(paises$pmaratm)
par (mfrow=c(1,1))


hist(paises$p100ms ,col=c("pink"), col.main="darkgray", prob=T , main="p100ms")


par (mfrow=c(3,3))
boxplot(paises$p100ms)
boxplot(paises$p200ms)
boxplot(paises$p400ms)
boxplot(paises$p800mm)
boxplot(paises$p1500mm)
boxplot(paises$p3000mm)
boxplot(paises$pmaratm)



par (mfrow=c(1,2))
boxplot(paises$pmaratm,col = "dark red")
boxplot(paises$pmaratm,range = 2.5)
par (mfrow=c(1,1))

?boxplot

boxplot.stats(paises$p100ms)
boxplot.stats(paises$p200ms)$out
boxplot.stats(paises$p400ms)$out
boxplot.stats(paises$p800mm)$out
boxplot.stats(paises$p1500mm)$out
boxplot.stats(paises$p3000mm)$out
boxplot.stats(paises$pmaratm)$out


par (mfrow=c(2,3))
plot (paises$p100ms,paises$p200ms)
plot (paises$p100ms,paises$p400ms)
plot (paises$p100ms,paises$p800mm)
plot (paises$p100ms,paises$p1500mm)
plot (paises$p100ms,paises$p3000mm)
plot (paises$p100ms,paises$pmaratm)

par (mfrow=c(2,3))
plot (paises$p200ms,paises$p400ms)
plot (paises$p200ms,paises$p800mm)
plot (paises$p200ms,paises$p1500mm)
plot (paises$p200ms,paises$p3000mm)
plot (paises$p200ms,paises$pmaratm)

par (mfrow=c(2,2))
plot (paises$p400ms,paises$p800mm)
plot (paises$p400ms,paises$p1500mm)
plot (paises$p400ms,paises$p3000mm)
plot (paises$p400ms,paises$pmaratm)

par (mfrow=c(2,3))
plot (paises$p800mm,paises$p1500mm)
plot (paises$p800mm,paises$p3000mm)
plot (paises$p800mm,paises$pmaratm)
plot (paises$p1500mm,paises$p3000mm)
plot (paises$p1500mm,paises$pmaratm)
plot (paises$p3000mm,paises$pmaratm)

par (mfrow=c(1,1))

panel.cor <- function(x, y, digits=2, prefix ="", cex.cor,
                      ...)  {
  usr <- par("usr")
  on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- cor(x, y , use = "pairwise.complete.obs")
  txt <- format(c(r, 0.123456789), digits = digits) [1]
  txt <- paste(prefix, txt, sep = "")
  if (missing(cex.cor))
    cex <- 0.8/strwidth(txt)
  # abs(r) é para que na saída as correlações ficam proporcionais
  text(0.5, 0.5, txt, cex = cex * abs(r))
}

#pdf(file = "grafico.pdf")
pairs(paises, lower.panel=panel.smooth, upper.panel=panel.cor)

