###These scripts will take a list of filename/prefixes and drop the foreground taxa from the fasta, then re-write the tree file to match it

##STEP1 This script will copy a list of fasta files (or prefixes) to a new directory
##These should be the genes that are P<0.05 for BUSTED and/or RELAX (intensified selection or relaxed selection) 
GetFiles.sh
DropTestGenes.txt #List of genes to do drop tests for 

##STEP 2 Drop the forground species from your fasta files and re-write them to a new subdir
DropSpecies_fastafiles.sh
DropSpecies_fastafiles.py

##STEP 3 re-write tree files to match new fasta files --- note you need a master tree file that this script can  prune from
writeTrees.py
WriteTrees.sh

#STEP3 run HF BUSTED on the all of the dropped fasta/tre file pairs 
dropBUSTED_HF.sh
