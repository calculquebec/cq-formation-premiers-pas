#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex2

# TODO: Charger les modules nécessaires
module load ....

# TODO: Ajuster, au besoin, le chemin suivant
SRCDIR=/project/def-sponsor00/photos/

####
# TODO: Ajouter les bons arguments à la commande ../filterImage.exe
#       pour transformer une première photo en grayscale.
# Utilisez ../filterImage.exe --help afin de trouver les arguments à utiliser
####

../filterImage.exe --srcdir $SRCDIR ......
