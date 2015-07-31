#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}

time ../serie.exe -p 2 --nb_pas 1000000000

#####
# TODO: Fixer la variable OMP_NUM_THREADS et invoquer ../serie.omp.exe avec les mêmes paramètres.
#####
export ...
time ../serie.omp.exe ...

