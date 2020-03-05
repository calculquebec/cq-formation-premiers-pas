#!/bin/bash
#SBATCH --time=00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=500M

module purge
module load python/3.7
module load scipy-stack

python code/code.py data/chiens.csv > resultats/chiens.log

echo $SLURM_TMPDIR
env | grep SLURM > resultats/env.log
