#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J metaquast
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load quast circos

# Libraries to assemble separately
# RR4342129_1.paired.trimmed.fastq.gz  RR4342133_1.paired.trimmed.fastq.gz
# RR4342129_2.paired.trimmed.fastq.gz  RR4342133_2.paired.trimmed.fastq.gz

# Assemblies to evaluate separately

# Assembly evaluation by metaquast
# The contigs can be found as final.contigs.fa in the megahit output directory.
# Gene finding will be done in CheckM after binning
# Call: metaquast.py -o  --output-dir  <dirname> -t  --threads <int> \
# -L Take assembly names from their parent directory names --circos Draw Circos plot version of Icarus data \
# contigs1.fa contigs2.fa

quast.py -t 2 -L --circos -o /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/02_metaquast \
/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm/final.contigs.fa \
/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342133_dna_assembly.megahit_asm/final.contigs.fa
