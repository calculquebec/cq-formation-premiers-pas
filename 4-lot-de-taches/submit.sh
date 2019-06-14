#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#####
# TODO: Ajouter la bonne option pour le lot de tâches
#####
#SBATCH --job-name=ex4

module load gcc boost

SRCDIR=/project/def-sponsor00/photos/

# Liste des filtres disponibles
FILTERS=(grayscale edges emboss negate solarize flip flop monochrome add_noise)

#####
# TODO: Utiliser le tableau FILTERS pour sélectionner le bon filtre en fonction de la valeur
# de SLURM_ARRAY_TASK_ID
#####
parallel ../filterImage.exe --srcdir $SRCDIR --files {1} --filters FIXME ::: $(ls $SRCDIR)
