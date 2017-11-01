#!/bin/bash
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=32
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here

module load boost
SRCDIR=/project/6002799/photos/


FILTERS="grayscale edges emboss negate solarize flip flop monochrome add_noise"

mpiexec ../filterImage.exe --filters $FILTERS --files $SRCDIR/*


