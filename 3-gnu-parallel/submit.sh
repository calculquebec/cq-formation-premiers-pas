#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost 
cd ${PBS_O_WORKDIR}
####
# TODO: Charger le module gnu-parallel
####



#####
# TODO: Ajouter la directive parallel avec les bons fichiers et arguments
#####
parallel ../serie.exe -p ... -n ... --ralentir :::: fichier1 :::: fichier2

