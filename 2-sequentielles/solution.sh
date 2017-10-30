#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=5:00
#SBATCH --account=def-mboisson 		      # Use your own account here

module load boost

../filterImage.exe --srcdir /project/6002799 --filters grayscale --files AG8B9528.png


