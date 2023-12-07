#!/bin/bash       
#SBATCH --time=96:00:00
#SBATCH --ntasks=1
#SBATCH --mem=50g
#SBATCH --tmp=20g
#SBATCH -p astyanax
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=drabe004@umn.edu

cd /panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_HF_split

# Define the target directory (change this to your desired directory)
TARGET_DIR="/panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF"

# Read prefixes from the file and process them
while IFS= read -r prefix
do
    # Find and move .fasta files
    find . -type f -name "${prefix}*.fasta" -exec mv {} "$TARGET_DIR" \;

   done < "/panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF/DropTestGenes.txt"
