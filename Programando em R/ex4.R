a <- c(332686,19790914,850,256570,1218)
b <-  a*2
c <- b/3
d <-  c + a ^2
e <- sqrt(d)
ai <- a[seq(length(a),by=-1)]


m1 <- matrix(c(a,b,c,d,e,ai),nrow = 6, ncol = 5, byrow = TRUE)
m2 <- matrix(c(a,b,c,d,e,ai),nrow = 5, ncol = 6, byrow = FALSE)

m3 <- m1*0.1

m4 <- matrix(as.matrix(sample(attitude$rating, attitude$privileges)),nrow=5, ncol=6)

View(m2)

matrix(as.matrix(a,b,c,d,e,ai),nrow = 6)

m5 <- m1 * m3

m6 <- m3 * m1

m7 <- m1 %*% m4

m8 <- m4 %*% m1


m5 == m6

m7 == m8


mt8 <- t(m8)

mt8 %*% m8

m8 %*% mt8
