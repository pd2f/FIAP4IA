setwd("C:/Users/Usuario/Documents/AI/FIAP4IA/Introdução AI")
projecoes_2018_indicadores <- read_excel("projecoes_2018_indicadores.xls")
df_ibge_proj_pop <-  matrix(as.numeric(unlist(projecoes_2018_indicadores[5:55,c("X__2","X__3","X__33")])),ncol =3)
nomescolunas <-  unlist(projecoes_2018_indicadores[4:4,c("X__2","X__3","X__33")],use.names = FALSE)
nomeslinhas <-  unlist(projecoes_2018_indicadores[5:55,c("BRASIL")],use.names = FALSE)
populacao_br <- data.frame(df_ibge_proj_pop)
rownames(populacao_br) <- nomeslinhas
colnames(populacao_br) <- nomescolunas
hom65 <- c(populacao_br$Homens*populacao_br$`65 +`)
mul65 <- c(populacao_br$Mulheres*populacao_br$`65 +`)
proj_pop_br <- cbind(populacao_br,hom65,mul65)
nomescolunas <- c(nomescolunas,"Homens 65+","Mulhere 65+")
colnames(proj_pop_br) <- c(nomescolunas)
View(proj_pop_br)
