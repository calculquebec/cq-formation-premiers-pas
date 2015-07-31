#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}

source /clumeq/bin/cq_blcr.sh
CKPT_DELAY=1
ckpt_run ../serie.omp.exe -p 2 -n  100000000000
ckpt_wait

