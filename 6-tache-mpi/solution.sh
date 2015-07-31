#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=2:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}
time mpiexec ../serie.mpi.exe -p 2 -n 1000000000 


