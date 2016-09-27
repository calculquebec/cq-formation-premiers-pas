#!/bin/bash
#PBS -A class
#####
# TODO: Request 2 full nodes of 12 processors
#####
#PBS -l nodes=1:ppn=4
#PBS -l walltime=10:00
#PBS -N ex6

module load iomkl/2015b Boost/1.59.0-Python-2.7.10 ImageMagick/7.0.1-6
cd ${PBS_O_WORKDIR}

#####
# TODO: Use mpiexec and filterImage-mpi.exe
#####
 ../filterImage.exe --filters grayscale add_noise monochrome --files ../../pictures/*
