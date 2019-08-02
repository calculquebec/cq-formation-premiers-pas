##################################
# Simple introduction with mclapply
# Authors: Sahir Bhatnagar and Erica E.M. Moodie (McGill)
# Updated by: Calcul Québec
##################################

library(parallel)
library(lme4)

nb_cores <- Sys.getenv("SLURM_CPUS_PER_TASK")
if (is.na(nb_cores) || nb_cores == '') { nb_cores = 2 }

message("Nb cores: ", nb_cores)

f <- function(i, n) {
  x <- runif(n*5)
  z <- rbinom(n*5, 1, x)
  ai <- rep(rnorm(n), each=5)
  y <- ai + 1 + x + z + rnorm(n*5)
  id <- rep(1:n, each=5)
  return(summary(lmer(y ~ x+z + (1 | id)))$coef[,1])
}

system.time({
  MyOutput <- mclapply(1:240, f, n=1024, mc.cores = nb_cores)
})

head(MyOutput)
