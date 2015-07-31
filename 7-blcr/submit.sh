#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}

source /clumeq/bin/cq_blcr.sh
####
# TODO: Modifier le délai de checkpointing
####
CKPT_DELAY=X

####
# TODO : Lancer la commande avec ckpt_run et ckpt_wait
####
../serie.omp.exe -p 2 -n  10000000000

