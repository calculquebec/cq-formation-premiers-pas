#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#####
# TODO: Ajouter l'option --cpus-per-task
#####
#SBATCH --mem-per-cpu=1G
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here

module load boost
SRCDIR=/project/6002799/photos/

#####
# TODO: Ajouter la directive parallel avec les bons fichiers et arguments
#####
../filterImage.exe --filters grayscale --srcdir $SRCDIR --files <fichier.png>


