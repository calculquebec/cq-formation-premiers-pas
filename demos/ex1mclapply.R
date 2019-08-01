##################################
# Simple introduction with mclapply
# Authors: Sahir Bhatnagar and Erica E.M. Moodie (McGill)
# Updated by: Calcul Québec
##################################

library(parallel)
library(lme4)

f <- function(i,n) {
  x <- runif(n*5)
  z <- rbinom(n*5,1,x)
  ai <- rep(rnorm(n),each=5)
  y <- ai + 1 + x + z + rnorm(n*5)
  id <- rep(1:n,each=5)
  return(summary(lmer(y ~ x+z + (1 | id)))$coef[,1])
}

system.time({
  MyOutput <- mclapply(1:5, f, n=1000)
})
MyOutput
