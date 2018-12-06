# T�cnica de Discrimina��o: �rvore de decis�o.

# limpar mem�ria do R
rm(list=ls(all=TRUE))


Campanha <- read.csv("E:/LABIA&ML2018/BaseCampanhaVarejo.csv", sep=";")

attach(Campanha)  

fix(Campanha)

str(Campanha )

summary(Campanha)

Campanha$RespCampanha <- factor(Campanha$RespCampanha)

# Frequ�ncia absoluta 
table(Campanha$RespCampanha)


#comando para gerar em 4 linhas e duas colunas os plots
par (mfrow=c(3,2))
plot(Campanha$RendaMensal, Campanha$RespCampanha,ylab="RespCampanha",xlab="RendaMensal",col=c('red','darkgreen'))
plot(Campanha$TempoRel, Campanha$RespCampanha , ylab="RespCampanha",xlab="TempoRel",col=c('red','darkgreen'))
plot(Campanha$VlMedio , Campanha$RespCampanha ,ylab="RespCampanha",xlab="VlMedio",col=c('red','darkgreen'))
plot(Campanha$Pct_Vestuario, Campanha$RespCampanha, ylab="RespCampanha",xlab="Pct_Vestuario",col=c('red','darkgreen'))
plot(Campanha$TempoDesdeUltCompra, Campanha$RespCampanha, ylab="RespCampanha",xlab="TempoDesdeUltCompra",col=c('red','darkgreen'))
plot(Campanha$RegValorCli , Campanha$RespCampanha, ylab="RespCampanha",xlab="RegValorCli",col=c('red','darkgreen'))


par (mfrow=c(1,1))




#Divisao do banco de dados completo em treinamento e teste
#definir % de casos de treino
prt <- 2/3

# amostra de casos de treino aleat�ria
set.seed(2018)
treino <- sample(1:NROW(Campanha), as.integer(prt*NROW(Campanha)))

trainData <- Campanha[treino,]
testData  <- Campanha[-treino,]

prop.table(table(trainData$RespCampanha))
prop.table(table(testData$RespCampanha))



# Carrega o pacote: �rvore de decis�o


install.packages("rpart") 
install.packages("rpart.plot") 

library(rpart) 
library(rpart.plot) 

# informa��es dos Par�metros do Modelo
## Usa rpart para decision tree
 
modelo_tree <- rpart (RespCampanha ~ TempoDesdeUltCompra + TempoRel + VlMedio  + Pct_Vestuario + RegValorCli     
              + RendaMensal, data=trainData, cp = 0.006,minsplit = 150,maxdepth=10)


# Faz o Gr�fico
rpart.plot(modelo_tree, type=4, extra=104, under=FALSE, clip.right.labs=TRUE,
           fallen.leaves=FALSE,   digits=2, varlen=-3, faclen=20,
           cex=0.4, tweak=1.7,
           compress=TRUE,
           snip=FALSE)

 # veja as op��es
?rpart.plot

rpart.plot(modelo_tree, type=2, extra="auto", under=FALSE, clip.right.labs=TRUE,
           fallen.leaves=TRUE,   digits=2, varlen=-3, faclen=15,
           cex=NULL, tweak=1.7,
           compress=TRUE,box.palette="auto",
           snip=FALSE)

print(modelo_tree)

# Predict como funcao para trazer a probabilidade do cliente perfil da camapnha(0/1)
yprob <- predict(modelo_tree,testData )
hist(yprob)

## Predict com tipo 'classe' retorna se � um perfil comprador ou n�o
pred_class <- predict(modelo_tree ,testData , type = "class")
pred_class 
 
Campanha.matriz.de.confus�o<-table(RespCampanha, pred_class)
Campanha.matriz.de.confus�o

diagonal <- diag(Campanha.matriz.de.confus�o)
perc.erro <- 1 - sum(diagonal)/sum(Campanha.matriz.de.confus�o)
perc.erro

#plotar regra do modelo preditivo

install.packages("rattle")

library(rattle)

fancyRpartPlot(modelo_tree, cex=0.60)

fancyRpartPlot(modelo_tree, cex=0.60,  palettes=c("Greys", "Oranges"))

?fancyRpartPlot


attach(trainData)
modelo_log<-glm(RespCampanha ~ TempoDesdeUltCompra + TempoRel + VlMedio  + Pct_Vestuario + RegValorCli     
               + RendaMensal,trainData, family=binomial(link=logit))
summary(modelo_log)

predito<-fitted(modelo_log)

summary(predito)

hist(predito)
# Criar vari�vel faixa probabilidade
fx_predito <- cut(predito, breaks=c(0,0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90,1), right=F)
plot(fx_predito , trainData$RespCampanha)

attach(testData)
Predito_teste<-predict(modelo_log, testData)

### Matriz de confus�o  

fx_predito1 <- cut(Predito_teste, breaks=c(0,0.50,1), right=F)

MC <- table( RespCampanha,  fx_predito1 , deparse.level = 2) # montar a matriz de confus�o  
show(MC) # mostra os resultados  
ACC = sum(diag(MC))/sum(MC) # calcula a acur�cia  
show(ACC) # mostra a acur�cia  



