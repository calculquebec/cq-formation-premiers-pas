#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost apps/gnu-parallel
cd ${PBS_O_WORKDIR}

parallel ../serie.exe -p {1} -n {2} --ralentir :::: liste_parametre.txt :::: liste_pas.txt

