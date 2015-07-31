#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00
#PBS -t [1-80:8]

module load libs/boost apps/gnu-parallel
cd ${PBS_O_WORKDIR}

L=$MOAB_JOBARRAYINDEX
U=$((L+7))
parallel ../serie.exe -p {1} ::: $(seq $L $U)


