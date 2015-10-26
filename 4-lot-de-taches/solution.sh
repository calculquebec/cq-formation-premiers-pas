#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00
#PBS -t [0-8:1]

module load compilers/gcc libs/boost libs/image_magick
module load apps/gnu-parallel
cd ${PBS_O_WORKDIR}

# Liste des filtres disponibles
FILTERS=(grayscale edges emboss negate solarize flip flop monochrome add_noise)

#####
# TODO: Ajouter la directive parallel avec les bons fichiers et arguments
#####
parallel ../filterImage.exe --filters ${FILTERS[$MOAB_JOBARRAYINDEX]} --files ../photos/{1} ::: $(ls ../photos)


