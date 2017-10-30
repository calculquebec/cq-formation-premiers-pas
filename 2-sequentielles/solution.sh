#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here

module load boost
SRCDIR=/project/6002799/photos/

../filterImage.exe --srcdir $SRCDIR --filters grayscale --files AG8B9528.png


