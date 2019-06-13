#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#####
# TODO: Ajouter l'option --cpus-per-task
#####
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex3

module load gcc boost

SRCDIR=/project/def-sponsor00/photos/

#####
# TODO: Ajouter la directive parallel avec les bons fichiers et arguments
#####
../filterImage.exe --srcdir $SRCDIR --files ... --filters grayscale
