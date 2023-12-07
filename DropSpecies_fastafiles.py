import os
import argparse
from Bio import SeqIO

def remove_species_from_fasta(input_dir, output_dir, species_list_file):
    # Read species to remove from the file
    with open(species_list_file, 'r') as file:
        species_to_remove = [line.strip() for line in file]

    for filename in os.listdir(input_dir):
        if filename.endswith(".fasta") or filename.endswith(".fa"):
            input_file = os.path.join(input_dir, filename)
            output_file = os.path.join(output_dir, os.path.splitext(filename)[0] + '_drop.fasta')

            with open(input_file, "r") as infile, open(output_file, "w") as outfile:
                for record in SeqIO.parse(infile, "fasta"):
                    if all(species not in record.id for species in species_to_remove):
                        SeqIO.write(record, outfile, "fasta")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Remove species from FASTA files in a directory.")
    parser.add_argument("input_directory", help="Path to the input directory containing FASTA files.")
    parser.add_argument("output_directory", help="Path to the output directory to save modified FASTA files.")
    parser.add_argument("species_list_file", help="File containing a list of species to remove from the FASTA files.")
    args = parser.parse_args()

    remove_species_from_fasta(args.input_directory, args.output_directory, args.species_list_file)
