#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here

# TODO: load correct modules here
module load ....

####
# TODO: Ajoutez les bons arguments à la commande ../filterImage.exe pour transformer l'image AG8B9528.png en grayscale. 
# Utilisez ../filterImage.exe --help afin de trouver les arguments à utiliser
####

../filterImage.exe --srcdir /project/6002799 ......



