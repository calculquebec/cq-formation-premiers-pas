#!/bin/bash
#PBS -A class
#PBS -l nodes=1:ppn=4
#PBS -l walltime=10:00
#PBS -N ex4
#####
# TODO: Add the PBS job array option
#####
#PBS -t 0-8

module load iomkl/2015b Boost/1.59.0-Python-2.7.10 ImageMagick/7.0.1-6
module load parallel/20150822
cd ${PBS_O_WORKDIR}

# List of filters
FILTERS=(grayscale edges emboss negate solarize flip flop monochrome add_noise)

# List of pictures
PICTURES=$(ls -1 ../../pictures/ | tail -4)

#####
# TODO: Use the FILTERS array and select the appropriate filter according
#       to the value of PBS_ARRAYID
#####
parallel ../filterImage.exe --filters ${FILTERS[$PBS_ARRAYID]} --files ../../pictures/{1} ::: $PICTURES
