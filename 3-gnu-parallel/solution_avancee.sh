#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load compilers/gcc libs/boost libs/image_magick
cd ${PBS_O_WORKDIR}
####
# TODO: Charger le module gnu-parallel
####
module load apps/gnu-parallel

#####
# TODO: Ajouter la directive parallel avec les bons fichiers et arguments
#####
parallel ../filterImage.exe --filters {2} --files ../photos/{1} ::: $(ls ../photos) ::: grayscale negate


