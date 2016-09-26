#!/bin/bash
#PBS -A class
#PBS -l nodes=1:ppn=12
#PBS -l walltime=10:00
#PBS -N ex2

module load iomkl/2015b Boost/1.59.0-Python-2.7.10 ImageMagick/7.0.1-6

cd ${PBS_O_WORKDIR}
PICTURES=$(ls -1 ../../pictures/ | head -12)

for picture in $PICTURES; do 
    ../filterImage.exe --filters grayscale --files ../../pictures/$picture &
done

wait
