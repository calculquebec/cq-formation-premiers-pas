#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00
#####
# TODO: Ajouter la bonne option pour le lot de tâches
#####

module load libs/boost libs/image_magick
module load apps/gnu-parallel
cd ${PBS_O_WORKDIR}

# Liste des filtres disponibles
FILTERS=(grayscale edges emboss negate solarize flip flop monochrome add_noise)

#####
# TODO: Utiliser le tableau FILTERS pour sélectionner le bon filtre en fonction de la valeur
# de MOAB_JOBARRAYINDEX
#####
parallel ../filterImage.exe --filters FIXME --files ../photos/{1} ::: $(ls ../photos)


