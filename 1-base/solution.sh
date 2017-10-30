#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=2:00
#SBATCH --account=def-mboisson 		      # Use your own account here
#SBATCH --reservation=training 		      # This is only needed for this training. Remove it after.
echo "bonjour"

