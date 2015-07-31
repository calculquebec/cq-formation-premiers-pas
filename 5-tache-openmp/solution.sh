#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}

time ../serie.exe -p 2 --nb_pas 1000000000

export OMP_NUM_THREADS=8
time ../serie.omp.exe -p 2 --nb_pas 1000000000

