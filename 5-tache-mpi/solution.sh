#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex5

SRCDIR=/project/def-sponsor00/photos/
FILTERS="grayscale edges emboss negate solarize flip flop monochrome add_noise"

mpiexec ../filterImage.exe --srcdir $SRCDIR --files $(ls $SRCDIR) --filters $FILTERS
