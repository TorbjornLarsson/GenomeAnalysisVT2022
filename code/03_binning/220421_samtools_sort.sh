#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J samtosortedbam
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load samtools/1.14

# Libraries to assemble separately
# RR4342129_1.paired.trimmed.fastq.gz  RR4342133_1.paired.trimmed.fastq.gz
# RR4342129_2.paired.trimmed.fastq.gz  RR4342133_2.paired.trimmed.fastq.gz

# Assemblies to evaluate separately
# /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm/final.contigs.fa
# /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342133_dna_assembly.megahit_asm/final.contigs.fa
#
# Has been filtered to
# /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342129_megahit_final_1500_filtered.fasta
# /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342133_megahit_final_1500_filtered.fasta

# And reads mapped in BBTools
# out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220421_RR4342129_aln.sam.gz
# out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220421_RR4342133_aln.sam.gz

# Convert sam to bam in memory to prepare for Metabat
# in /analyses/03_binning/01_metabat
# Call: samtools view -u file.sam -@ 2 | samtools sort -o file_sorted -@ 2

samtools view -@ 2 -u /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220421_RR4342129_aln.sam.gz \
| samtools sort -@ 2 -o /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220421_RR4342129_aln_sorted.bam

samtools view -@ 2 -u /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220421_RR4342133_aln.sam.g \
| samtools sort -@ 2 -o /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220421_RR4342133_aln_sorted.bam


