set.seed(1)
x <- rnorm(100,0,1)
e <- rnorm(100,0,2)

y <- 0.5+(x*2) + e


plot_ly( x = x, y = y, type = "scatter" )
