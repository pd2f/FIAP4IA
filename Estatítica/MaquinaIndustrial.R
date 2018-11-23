# limpar mem?ria do R
rm(list=ls(all=TRUE))


# mostrar at? 2 casas decimais
options("scipen" = 2)

# Os  dados  é de uma base onde queria-se testrar o  desempenho  de
# uma  máquina  industrial.  O  experimento  utilizou  uma  mistura  de  óleo  diesel  e  gás,
# derivados  de  materiais  destilados  orgânicos.  O  valor  da  capacidade  da  máquina  em
# cavalo  vapor  (HP)  foi  coletado  a  diversas  velocidades  medidas  em  rotações  por
# minuto (rpm X 100).


# Ler arquivo xls.

library(readxl)
maquina <- read_excel("E:/LABIA&ML2018/MaquinaIndustrial.xlsx")
 
View(maquina)
 

# trabalhar com as variaveis 
attach(maquina)
#Verificando o formato das variaveis
str(maquina)


#Estatisticas descritivas - Medidas resumo
summary(maquina)

#comando para gerar em 3 linhas e duas colunas os histogramas
par (mfrow=c(1,2))
hist(maquina$velocidade)
hist(maquina$capacidade)

par (mfrow=c(1,1))

# matriz de correla??es
matcor <- cor(maquina)
print(matcor, digits = 2)



#Gr?fico de dispersao para a associa??o entre ?rea m2 e valor
plot (x = maquina$velocidade, y = maquina$capacidade,
      main = "Grafico de dispersao",
      xlab = "velocidade",
      ylab = "capacidade")


# Op??es de gr?ficos: Gr?fico de dispersao com o plotly

install.packages("plotly")
library(plotly)
plot_ly (x=maquina$capacidade  , y=maquina$velocidade, type="scatter")


#Gr?fico de dispersao com o ggplot2
install.packages("ggplot2")

library(ggplot2)
ggplot (data= maquina, aes(x=maquina$velocidade, y=maquina$capacidade )) + 
  geom_point(size=0.4) +
  geom_smooth(method="lm", color ="red", linetype=2) +
  labs(title = "Grafico de dispers?oo, capacidade e velocidade", x="velocidade", y="capacidade")



attach(maquina)
# Modelo de regressao linear simples

modelo0 <- lm(capacidade ~ velocidade)
summary(modelo0)


Val_pred <- predict(modelo0,interval = "prediction", level = 0.95) 
fix(Val_pred)
# intervalo de confianca - grafico para media
fit <- Val_pred[,1] # valores preditos
lower <- Val_pred[,2] # limite inferior
upper <- Val_pred[,3] # limite superior


mse <- mean((maquina$capacidade - fit)^2)
sqrt(mse)

erro_usando_media <- mean((maquina$capacidade - mean(maquina$capacidade))^2)
sqrt(erro_usando_media)


# grafico residuo
rs <- resid(modelo0)
plot(predict(modelo0), rs, xlab = "Preditor linear",ylab = "Residuos")
abline(h = 0, lty = 2)


#observa-se SE viola??o da suposi??o de que os erros aleat?rios t?m distribui??o Normal
  
qqnorm(residuals(modelo0), ylab="Res?duos",xlab="Quantis te?ricos",main="")
qqline(residuals(modelo0))

#Teste de Normalidade de Shapiro Wilk

# sE Valor P do teste ? pequeno, rejeita-se a hip?tese de normalidade dos res?duos e,
# por consequ?ncia, conclui-se que os erros n?o s?o normalmente distribu?dos.

shapiro.test(residuals(modelo0))

## perform Durbin-Watson test
dwtest(residuals(modelo0))

attach(maquina)
maquina_Final<-cbind(maquina,Val_pred)

fix(maquina_Final)

plot (x = maquina$raiz_vel, y = maquina$capacidade,
      main = "Grafico de dispersao",
      xlab = "raiz velocidade",
      ylab = "capacidade")



