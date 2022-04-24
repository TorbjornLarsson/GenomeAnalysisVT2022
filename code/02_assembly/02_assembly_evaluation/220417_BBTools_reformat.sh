#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J bbt/reformat
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

# Filter in BBTools:
# Call: reformat.sh \
#      in=${ANALYSIS_FOLDER}/assembly/megahit/$(basename ${i%.1*})/megahit_final.contigs.fa \
#      out=${ANALYSIS_FOLDER}/assembly/megahit/$(basename ${i%.1*})/megahit_final_1000_filtered.fasta \
#      minlength=1000

/sw/bioinfo/bbmap/38.61b/snowy/reformat.sh \
in=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm/final.contigs.fa \
out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342129_megahit_final_1500_filtered.fasta \
minlength=1500

/sw/bioinfo/bbmap/38.61b/snowy/reformat.sh \
in=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342133_dna_assembly.megahit_asm/final.contigs.fa \
out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342133_megahit_final_1500_filtered.fasta \
minlength=1500

