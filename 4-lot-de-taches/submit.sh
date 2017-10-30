#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem-per-cpu=1G
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here
#####
# TODO: Ajouter la bonne option pour le lot de tâches
#####

module load boost
SRCDIR=/project/6002799/photos/

# Liste des filtres disponibles
FILTERS=(grayscale edges emboss negate solarize flip flop monochrome add_noise)

#####
# TODO: Utiliser le tableau FILTERS pour sélectionner le bon filtre en fonction de la valeur
# de MOAB_JOBARRAYINDEX
#####
parallel ../filterImage.exe --srcdir $SRCDIR --filters FIXME --files {1} ::: $(ls $SRCDIR)


