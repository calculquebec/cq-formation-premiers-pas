#!/bin/bash
#PBS -A colosse-users
##### 
# TODO: Changer le nombre de noeuds utilisés pour en utiliser 4
#####
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load compilers/gcc libs/boost libs/image_magick
cd ${PBS_O_WORKDIR}

####
# TODO: Appeler l'exécutable ../filterImage.exe avec mpiexec
####
 ../filterImage.exe --filters monochrome --files ../photos/*


