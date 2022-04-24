#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J metabat
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load MetaBat/2.12.1

# Libraries to assemble separately
# RR4342129_1.paired.trimmed.fastq.gz  RR4342133_1.paired.trimmed.fastq.gz
# RR4342129_2.paired.trimmed.fastq.gz  RR4342133_2.paired.trimmed.fastq.gz

# DNA assemblies
# The contigs can be found as final.contigs.fa in the output directory.
# -o /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm # 2 paired-end libraries
# -o /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342133_dna_assembly.megahit_asm # 2 paired-end libraries

# Binning each assembly
# Call: metabat -i (contigs fasta infile) -o (outdirectory) -t 2 -m 1500 -v --unbinned

metabat \
-i /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm/final.contigs.fa \
-o /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220417_RR4342129_metabat \
-t 2 \
-m 1500 \
-v \
--unbinned

metabat \
-i /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342133_dna_assembly.megahit_asm/final.contigs.fa \
-o /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220417_RR4342133_metabat \
-t 2 \
-m 1500 \
-v \
--unbinned


