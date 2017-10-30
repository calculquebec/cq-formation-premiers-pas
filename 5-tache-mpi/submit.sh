#!/bin/bash
##### 
# TODO: Changer la configuration pour utiliser 32 tâches par noeud avec 1 CPU par tâche
#####
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32
#SBATCH --mem-per-cpu=1G
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here

module load boost
SRCDIR=/project/6002799/photos/

####
# TODO: Appeler l'exécutable ../filterImage.exe avec mpiexec
####
 ../filterImage.exe --filters monochrome --files $SRCDIR/*


