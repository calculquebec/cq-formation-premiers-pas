#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00
#####
# TODO: Ajouter la directive de job array
#PBS ...
#####

module load libs/boost apps/gnu-parallel
cd ${PBS_O_WORKDIR}

#####
# TODO : Calculer L et U pour calculer 8 paramètres pour chaque sous-tâche.
# Indice 1 : Utiliser $MOAB_JOBARRAYINDEX
# Indice 2 : Vous pouvez faire des calculs arithmétiques de base avec les doubles parenthèses : $((3+4)) => 7
#####
L=...
U=...

parallel ../serie.exe -p {1} ::: $(seq $L $U)


