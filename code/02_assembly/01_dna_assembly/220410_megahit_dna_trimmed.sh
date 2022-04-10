#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J megahit
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load megahit/1.2.9

# Libraries to assemble separately
# RR4342129_1.paired.trimmed.fastq.gz  RR4342133_1.paired.trimmed.fastq.gz
# RR4342129_2.paired.trimmed.fastq.gz  RR4342133_2.paired.trimmed.fastq.gz

# DNA assembly by Megahit
# The contigs can be found final.contigs.fa in the output directory.
# Use “--kmin-1pass” to reduce memory usage or it will crash in UPPMAX
# Use --k-list 65,75,85,95,105
megahit -t 2 --kmin-1pass --k-list 65,75,85,95,105 \
-1 /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342129_1.paired.trimmed.fastq.gz \
-2 /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342129_2.paired.trimmed.fastq.gz \
-o /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm # 2 paired-end libraries

megahit -t 2 --kmin-1pass --k-list 65,75,85,95,105 \
-1 /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342133_1.paired.trimmed.fastq.gz \
-2 /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342133_2.paired.trimmed.fastq.gz \
-o /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342133_dna_assembly.megahit_asm # 2 paired-end libraries
