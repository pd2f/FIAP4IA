e1 <-  new.env()

assign("var1",1,envir = e1)

var1 = "x"

oea <- function(){
  print(environment())
  print(globalenv())
}

for(i in 1:5){
  oea()  
}

with(
  mtcars,ls()
  
)

install.packages("lattice")

library(lattice)


state <- data.frame(state.x77,
                    region = state.region)
xyplot(Life.Exp ~ Income | region,
       data = state,
       layout = c(4, 1))

