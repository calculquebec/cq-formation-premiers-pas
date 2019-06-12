#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex2

module load gcc boost

SRCDIR=/project/def-sponsor00/photos/

../filterImage.exe --srcdir $SRCDIR --filters grayscale --files $(ls $SRCDIR | head -1)
