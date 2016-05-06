#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=4:ppn=8
#PBS -l walltime=16:00

module load libs/boost libs/image_magick
cd ${PBS_O_WORKDIR}

mpiexec ../filterImage.exe --filters add_noise monochrome --files ../photos/*


