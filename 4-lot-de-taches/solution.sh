#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --array=0-8:1
#SBATCH --job-name=ex4

module load gcc boost

SRCDIR=/project/def-sponsor00/photos/

# Liste des filtres disponibles
FILTERS=(grayscale edges emboss negate solarize flip flop monochrome add_noise)

parallel ../filterImage.exe --srcdir $SRCDIR --files {1} --filters ${FILTERS[$SLURM_ARRAY_TASK_ID]} ::: $(ls $SRCDIR)
