#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1G
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here
#SBATCH --array=0-8:1

module load boost
SRCDIR=/project/6002799/photos/

# Liste des filtres disponibles
FILTERS=(grayscale edges emboss negate solarize flip flop monochrome add_noise)

#####
# TODO: Ajouter la directive parallel avec les bons fichiers et arguments
#####
parallel ../filterImage.exe --srcdir $SRCDIR --filters ${FILTERS[$SLURM_ARRAY_TASK_ID]} --files {1} ::: $(ls $SRCDIR)


