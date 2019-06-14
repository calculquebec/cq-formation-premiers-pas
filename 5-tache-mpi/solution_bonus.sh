#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex5

module load gcc boost

SRCDIR=/project/def-sponsor00/photos/

mpiexec ../filterImage.exe --srcdir $SRCDIR --files $(ls $SRCDIR) --filters add_noise monochrome --combined true
