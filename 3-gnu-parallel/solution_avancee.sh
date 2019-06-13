#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex3

module load gcc boost

SRCDIR=/project/def-sponsor00/photos/

parallel ../filterImage.exe --srcdir $SRCDIR --files {1} --filters {2} ::: $(ls $SRCDIR) ::: grayscale negate
