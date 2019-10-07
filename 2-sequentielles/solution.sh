#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex2

# EN: Load all required modules
# FR: Charger les modules nécessaires
module load gcc boost

# EN: If needed, adjust the following path
# FR: Ajuster, au besoin, le chemin suivant
SRCDIR=/project/def-sponsor00/photos/

####
# EN: Add required arguments to the ../filterImage.exe command in order
#     to transform one picture into grayscale. To list available arguments:
#     ../filterImage.exe --help
# FR: Ajouter les bons arguments à la commande ../filterImage.exe
#     pour transformer une photo en grayscale. Pour trouver les bon arguments:
#     ../filterImage.exe --help
####

../filterImage.exe --srcdir $SRCDIR --files $(ls $SRCDIR|head -1) --filters grayscale
