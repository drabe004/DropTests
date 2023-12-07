#!/bin/bash       
#SBATCH --time=96:00:00
#SBATCH --ntasks=2
#SBATCH --mem=100g
#SBATCH --tmp=50g
#SBATCH -p astyanax
#SBATCH --mail-type=ALL  
#SBATCH --mail-user=drabe004@umn.edu

# Load necessary modules
module use /common/software/modulefiles/manual/common
module load hyphy/2.5.53


# Directory containing alignment and tree files
input_dir=/panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF/Dropped_files
# Output directory for results
output_dir=/panfs/jay/groups/26/mcgaughs/drabe004/Fish_MSAs_Fernando/1_Drop_Tests_HF/Dropped_files/BUSTEDResults

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through alignment files
for alignment_file in "$input_dir"/*_MACSE_final_mask_align_NT_CLEAN_drop.fasta; do
    # Extract prefix from alignment filename
    alignment_prefix=$(basename "$alignment_file" _MACSE_final_mask_align_NT_CLEAN_drop.fasta)
    
    # Construct corresponding tree filename
    tree_file="$input_dir/${alignment_prefix}_MACSE_final_mask_align_NT_CLEAN_drop.tre"
    
    # Construct output filename
    output_file="$output_dir/${alignment_prefix}_dropBUSTEDHF"
    
    # Check if the tree file exists
    if [ -f "$tree_file" ]; then
        # Run the hyphy command and redirect output to the output file
        hyphy -1 busted --alignment "$alignment_file" --tree "$tree_file"  > "$output_file"
    else
        echo "Tree file for $alignment_file not found."
    fi
done
