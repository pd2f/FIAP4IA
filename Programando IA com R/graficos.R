x = -10:10
plot( x = x, y = x**2, main = 'Parábola')
plot( x = x, y = x**2, main = 'Parábola', type = 'l')
plot( x = x, y = x**2, main = 'Parábola', type = 'p')
plot( x = x, y = x**2, main = 'Parábola', type = 'o')
plot( x = x, y = x**2, main = 'Parábola', type = 'b')
plot( x = x, y = x**2, main = 'Parábola', type = 'h')
plot( x = x, y = x**2, main = 'Parábola', type = 's')
plot( x = x, y = x**2, main = 'Parábola', type = 'S')

View(cars)

head(cars)
summary(cars)
plot( x= cars$speed, y = cars$dist, type='p')

abline(a= cars$speed, b = cars$dist, untf=FALSE )

summary(airquality)

boxplot( airquality )


head(airquality)
install.packages("dplyr")
library(dplyr)


airquality %>% filter(Month == 5) %>% arrange(Ozone) -> prepar

plot(x= prepar$Ozone )   
linhas <- summary(prepar$Ozone)

lines(x=c(1,30), y=c(linhas["Min."],linhas["Min."]),col = "blue")
lines(x=c(1,30), y=c(linhas["Median"],linhas["Median"]),col = "red")
lines(x=c(1,30), y=c(linhas["1st Qu."],linhas["1st Qu."]),col = "blue")
lines(x=c(1,30), y=c(linhas["3rd Qu."],linhas["3rd Qu."]),col = "blue")
lines(x=c(1,30), y=c(linhas["Max."],linhas["Max."]),col = "blue")

airquality %>% filter(Month == 5) %>% arrange(Ozone) -> maio
airquality %>% filter(Month == 6) %>% arrange(Ozone) -> junho
airquality %>% filter(Month == 7) %>% arrange(Ozone) -> julho
airquality %>% filter(Month == 8) %>% arrange(Ozone) -> agosto
airquality %>% filter(Month == 9) %>% arrange(Ozone) -> setembro
boxplot( maio$Ozone,junho$Ozone,julho$Ozone,agosto$Ozone,setembro$Ozone )

boxplot(formula= airquality$Ozone ~ airquality$Month)

boxplot(formula= airquality$Temp ~ airquality$Month)

boxplot(formula= airquality$Wind ~ airquality$Month)
boxplot(formula= airquality$Solar.R ~ airquality$Month)


boxplot(formula= airquality$Solar.R ~ airquality$Month)

summary(airquality$Ozone)

1(7)
2(6)
3(6)
4(8)
5(7)
6(8)
7 (sim)

plot(airquality$Wind,airquality$Ozone)

regre <-  lm(formula =airquality$Ozone ~ airquality$Wind)
abline(regre)
regre$coefficients["(Intercept)"]/regre$coefficients["airquality$Wind"]
lines(x=c(0,sqrt((regre$coefficients["(Intercept)"]/regre$coefficients["airquality$Wind"])**2)),
      y=c(regre$coefficients["(Intercept)"],0),col='orange')

par(mfrow=c(2,2))

pi <- 8



