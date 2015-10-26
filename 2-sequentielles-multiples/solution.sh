#!/bin/bash
#PBS -A colosse-users
#PBS -l nodes=1:ppn=8
#PBS -l walltime=16:00

module load compilers/gcc libs/boost libs/image_magick

cd ${PBS_O_WORKDIR}
PHOTOS="AG8B9528.png  AG8B9531.png  AG8B9533.png  AG8B9535.png AG8B9538.png  AG8B9540.png  AG8B9544.png  AG8B9546.png"

for photo in $PHOTOS; do 
	../filterImage.exe --filters grayscale --files ../photos/$photo   &
done
wait


