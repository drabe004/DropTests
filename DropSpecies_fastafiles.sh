#!/bin/bash -l        
#SBATCH --time=12:00:00
#SBATCH --ntasks=1
#SBATCH --mem=100g
#SBATCH --tmp=50g
#SBATCH -p astyanax
#SBATCH --mail-type=ALL
#SBATCH --mail-user=drabe004@umn.edu

cd /panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF
module load python3

# Path to your species list file
SPECIES_LIST_FILE="Foreground_Taxa.txt"

# Execute the Python script
python3 DropSpecies_fastafiles.py /panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF /panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF/Dropped_files "$SPECIES_LIST_FILE"
