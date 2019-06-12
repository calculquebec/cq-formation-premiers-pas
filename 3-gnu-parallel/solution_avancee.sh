#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1G
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here

module load gcc boost
SRCDIR=/project/6002799/photos/

parallel ../filterImage.exe --srcdir $SRCDIR --filters {2} --files {1} ::: $(ls $SRCDIR) ::: grayscale negate


