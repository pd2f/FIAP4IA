A = as.matrix( attitude[21:25, 1:5] )
B = as.matrix( attitude[11:15, 1:5] )

x <- B/A

A * x

B
?rnorm



set.seed(0.5)

rnorm(5)
