#!/bin/bash
#PBS -A class
#PBS -l nodes=1:ppn=12
#PBS -l walltime=10:00
#PBS -N ex2

module load iomkl/2015b Boost/1.59.0-Python-2.7.10 ImageMagick/7.0.1-6

cd ${PBS_O_WORKDIR}
PICTURES=$(ls -1 ../../pictures/ | head -12)

####
# TODO: Use a for-loop to process all pictures in $PICTURES.
# Hint: use the command below in your for-loop.
# Note: Make sure to start all processes in background with "&",
# and add a "wait" at the end of the script.
####

    ../filterImage.exe --filters grayscale --files ../../pictures/$picture

