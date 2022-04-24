#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J bbt/wrap_pileup
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load bbmap/38.61b

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

# Map reads in BBTools
# Call: bbwrap.sh in=<file,file,...> out=<file,file,...> ref=file

/sw/bioinfo/bbmap/38.61b/snowy/bbwrap.sh \
in1=/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342129_1.paired.trimmed.fastq.gz \
in2=/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342129_2.paired.trimmed.fastq.gz \
out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342129_aln.sam.gz \
ref=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342129_megahit_final_1500_filtered.fasta \
nodisk append


/sw/bioinfo/bbmap/38.61b/snowy/bbwrap.sh \
in1=/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342133_1.paired.trimmed.fastq.gz \
in2=/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/dna/RR4342133_2.paired.trimmed.fastq.gz \
out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342133_aln.sam.gz \
ref=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342133_megahit_final_1500_filtered.fasta \
nodisk append

# Derive contig coverage in BBTools
# Call: bbmap/pileup.sh in=aln.sam.gz out=cov.txt

/sw/bioinfo/bbmap/38.61b/snowy/pileup.sh \
in=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342129_aln.sam.gz \
out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342129_aln_cov.txt

/sw/bioinfo/bbmap/38.61b/snowy/pileup.sh \
in=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342133_aln.sam.gz \
out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342133_aln_cov.txt

