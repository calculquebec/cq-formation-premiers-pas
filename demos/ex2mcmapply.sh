#!/bin/bash
#SBATCH --job-name=sim1
#SBATCH --array=1-9:1
#SBATCH --time=0:5:0
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=1000M
#SBATCH --output=log/%x-%j.out

cd $SLURM_SUBMIT_DIR

mkdir -p results

Rscript ex2mcmapply.R $SLURM_ARRAY_TASK_ID
