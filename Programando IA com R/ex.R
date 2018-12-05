install.packages("dplyr")
library(dplyr)

library(readr)
fifa_game_2 <- read_csv("IAcomR/fifa game-2.csv", 
                        locale = locale(encoding = "ISO-8859-1"))


fifa_game_2 %>% filter(league=="Spanish Primera División") %>% select(name,dribbling, acceleration, long_passing) -> spain.2d
plot(spain.2d[,-1])

cl <- kmeans(spain.2d[,-1],4)

set.seed(2)
plot_ly(spain.2d[,-1], col=cl$cluster, pch=21, cex=1)
points(cl$centers, col=4:1, bg=1:4, pch=24, cex=1, lwd=1)


modelo = kmeans(spain.2d[,c('dribbling','acceleration')], centers = 4)
rbind( cbind('betweenss:', modelo$betweenss),
       cbind('totss:', modelo$totss),
       cbind('quality:', modelo$betweenss / modelo$totss ))
plot(spain.2d[,c('dribbling','acceleration')],
     col = modelo$cluster,
     pch = 20, cex = 2)
points(modelo$centers, col = rev(seq_along(modelo$centers)),
       bg=seq_along(modelo$centers), pch = 24, cex =1, lwd = 1)


library(cluster)
x <- rbind(matrix(rnorm(100, mean = 0.5, sd = 4.5), ncol = 2),
           matrix(rnorm(100, mean = 0.5, sd = 0.1), ncol = 2))
colnames(x) <- c("x", "y")
modelo1 <- pam(x,2)
modelo2 <- kmeans(x, 2)
par(mfrow=c(1,2))
plot(x, col = modelo1$clustering, main="Clusters k-Medoids")
points(modelo1$medoids, col = 1:3, pch = 10, cex = 4)
plot(x, col = modelo2$cluster, main="Clusters k-Means")
points(modelo2$centers, col = 1:3, pch = 10, cex = 4)


colorPallete1 = c("red", "yellow", "green")
plot(x=seq_along(colorPallete1), col=colorPallete1, pch=19, cex=10)
gradiente1 = colorRampPalette(colorPallete1)(n = 30)
plot(x=seq_along(gradiente1), col=gradiente1, pch=19, cex=10)


colorPallete2 = c("#f8696b", "#ffeb84", "#63be7b")
plot(x=seq_along(colorPallete2), col=colorPallete2, pch=19, cex=10)
gradiente2 = colorRampPalette(colorPallete2)(n = 30)
plot(x=seq_along(gradiente2), col=gradiente2, pch=19, cex=10)


cores <- c("red", "orange", "yellow", "green", "blue")
plot(x=seq_along(cores), col=cores, pch=19, cex=10)
gradiente3 = colorRampPalette(cores)(n = 30)
plot(x=seq_along(gradiente3), col=gradiente3, pch=19, cex=10)


fifa_game_2 %>%
  filter(league=="Spanish Primera División") %>%
  select(name, age, height_cm, dribbling) -> spain.colors
with(spain.colors,
     plot( x = height_cm, y = age )
)

fifa_game_2 %>%
  filter(league=="Spanish Primera División") %>%
  select(name, age, height_cm, dribbling) -> spain.colors
with(spain.colors,
     plot( x = height_cm, y = age )
)


x <- filter(fifa_game_2,age ==35 & height_cm==195 )


x$name
