#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}

../serie.exe -p 1 &
../serie.exe -p 2 &
../serie.exe -p 3 &
../serie.exe -p 4 &
../serie.exe -p 5 &
../serie.exe -p 6 &
../serie.exe -p 7 &
../serie.exe -p 8 &

wait

