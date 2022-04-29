#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J metaquast
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load quast

# Libraries to assemble separately
# RR4342129_1.paired.trimmed.fastq.gz  RR4342133_1.paired.trimmed.fastq.gz
# RR4342129_2.paired.trimmed.fastq.gz  RR4342133_2.paired.trimmed.fastq.gz

# Assemblies to evaluate separately

# Assembly evaluation by metaquast
# The contigs can be found as final.contigs.fa in the output directory.
# Gene finding will be done in CheckM after binning
# Call: metaquast.py contigs_1 contigs_2 -o  --output-dir  <dirname> -m  --min-contig  <int> 3000 in paper -t  --threads     <int> \
# -L Take assembly names from their parent directory names --circos Draw Circos plot version of Icarus data -> 1st on test evaluation data \
# --fast  A combination of all speedup options except --no-check -> 2nd time
# 1st on test evaluation data:
module load circos 
quast.py -t 2 --circos -r /domus/h1/tola2495/test_data/reference.fasta.gz -o /domus/h1/tola2495/quast_test_output/ /domus/h1/tola2495/test_data/contigs_1.fasta /domus/h1/tola2495/test_data/contigs_2.fasta

#megahit -t 2 --kmin-1pass --k-list 65,75,85,95,105 \
#-o /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm # 2 paired-end libraries

#megahit -t 2 --kmin-1pass --k-list 65,75,85,95,105 \
#-o /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342133_dna_assembly.megahit_asm # 2 paired-end libraries
