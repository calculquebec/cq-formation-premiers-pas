#!/bin/bash
#SBATCH --account=def-sponsor00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#####
# EN: Add the --cpus-per-task option
# FR: Ajouter l'option --cpus-per-task
#####
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=5:00
#SBATCH --job-name=ex3

module load gcc boost

SRCDIR=/project/def-sponsor00/photos/

#####
# EN: Add the "parallel" directive with proper arguments and a list of files
# FR: Ajouter la directive parallel avec les bons fichiers et arguments
#####
../filterImage.exe --srcdir $SRCDIR --files ... --filters grayscale
