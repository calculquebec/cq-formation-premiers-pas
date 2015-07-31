#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load libs/boost
cd ${PBS_O_WORKDIR}

####
# TODO: Ajouter les lignes de commandes pour les parametres de 2 à 8 et les faire exécuter en arrière plan
####
../serie.exe -p 1

