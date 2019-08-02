##################################
# R source code file for conducting simulations using the parallel package with 
# command line arguments. The main idea is to define a data.frame of simulation 
# parameters, and then use command line arguments to reference a particular 
# combination of simulation parameters
# Usage: Rscript ex2mcmapply.R index
# Authors: Sahir Bhatnagar and Erica E.M. Moodie (McGill)
# Updated by: Calcul Québec
# Notes: 
# sbatch parameter to cycle through all 9 combinations of simulation parameters:
# #SBATCH --array=1-9:1
# Use ex2mcmapply.sh to submit to compute cluster
# Use collectResults.R to combine results in one data.frame
##################################


# load libraries ----------------------------------------------------------

library(parallel)
library(lme4)


# Define a data.frame of simulation parameters ----------------------------

parametersDf <- base::expand.grid(sampleSize = c(200, 500, 1000),
                                  noiseSD = c(1,2,3),
                                  replications = 10,
                                  stringsAsFactors = FALSE)


# get simulation scenario index from command line args --------------------

parameterIndex <- base::as.numeric(base::as.character(base::commandArgs(trailingOnly = T)[1]))

# select simulation parameters based on command line argument
simulationParameters <- parametersDf[parameterIndex,, drop = F]
replications <- 1:simulationParameters[["replications"]]
sampleSize <- simulationParameters[["sampleSize"]]
noiseSD <- simulationParameters[["noiseSD"]]

# Simulation function definition ------------------------------------------

f <- function(i, n, sd, scenario = parameterIndex) {

  # simulate data
  x <- stats::runif(n*5)
  z <- stats::rbinom(n*5,1,x)
  ai <- base::rep(stats::rnorm(n), each = 5)
  
  # generate response with noise
  y <- ai + 1 + x + z + stats::rnorm(n*5, sd = sd)
  
  # generate cluster ID
  id <- base::rep(1:n, each = 5)

  # fit linear mixed model and get summary
  fit <- lme4::lmer(y ~ x + z + (1 | id))
  sfit <- summary(fit)
  
  
  # return list of simulation parameters and lmm coefficients
  return(list(scenario = scenario,
              replicate = i, 
              sampleSize = n, 
              noiseSD = sd, 
              b0 = sfit$coefficients[1,1], 
              bx = sfit$coefficients[2,1],
              bz = sfit$coefficients[3,1]))
}



# Execute simulation ------------------------------------------------------

MyOutput <- parallel::mcmapply(FUN = f, 
                               i = replications,
                               MoreArgs = list(n = sampleSize,
                                               sd = noiseSD),
                               SIMPLIFY = FALSE)


# Collect results in a matrix ---------------------------------------------

results <- base::do.call(base::rbind, MyOutput)


# Write results to file ---------------------------------------------------

# Create filename with random pattern extension. assumes you have a directory called "results"
# Change tmpdir to the directory where you want to store results
# Depending on system, the SLURM_SUBMIT_DIR might be set and can be used via
# paste(Sys.getenv("SLURM_SUBMIT_DIR"),"results", sep="/")
filename <- base::tempfile(pattern = base::sprintf("scenario_%1.0f_sampleSize_%1.0f_noiseSD_%1.0f_",
                                                   parameterIndex, 
                                                   sampleSize, 
                                                   noiseSD),
                           tmpdir = "results",
                           fileext = ".txt")

utils::write.table(results,
                   file = filename,
                   quote = FALSE,
                   row.names = FALSE,
                   col.names = FALSE)
