#!/bin/bash -l        
#SBATCH --time=2:00:00
#SBATCH --ntasks=2
#SBATCH --mem=50g
#SBATCH --tmp=25g
#SBATCH -p astyanax
#SBATCH --mail-type=ALL
#SBATCH --mail-user=drabe004@umn.edu


cd /panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF
module load python3

#python3 script.py treefile.tre alignment/Directory
python3 writeTrees.py /panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/SpeciesTree_SmallNames_EDITED.tre /panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF/Dropped_files