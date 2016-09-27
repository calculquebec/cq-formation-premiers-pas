#!/bin/bash
#PBS -A class
#PBS -l nodes=1:ppn=12
#PBS -l walltime=10:00
#PBS -N ex3a

module load iomkl/2015b Boost/1.59.0-Python-2.7.10 ImageMagick/7.0.1-6
####
# TODO: Load the GNU-Parallel module
####
module load parallel/20150822

cd ${PBS_O_WORKDIR}

#####
# TODO: Use the 'parallel' command to compute the first 12 pictures with
#       a) Normal:   grayscale only
#       b) Advanced: grayscale only and negate only
#####
PICTURES=$(ls -1 ../../pictures/ | head -12)
parallel ../filterImage.exe --filters grayscale --files ../../pictures/{1} ::: $PICTURES
