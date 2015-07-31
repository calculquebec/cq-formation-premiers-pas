#!/bin/bash
#PBS -A colosse-users
##### 
# TODO: Changer le nombre de noeuds utilisés pour en utiliser 2
#####
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}

####
# TODO: Appeler l'exécutable ../serie.mpi.exe avec mpiexec
####
 ../serie.exe -p 2 -n 1000000000 


