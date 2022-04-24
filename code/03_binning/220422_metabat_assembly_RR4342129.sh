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

# Has been filtered to
# /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342129_megahit_final_1500_filtered.fasta
# /home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220417_RR4342133_megahit_final_1500_filtered.fasta

# And reads mapped in BBTools
# out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220421_RR4342129_aln.sam.gz
# out=/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/03_BBTools/220421_RR4342133_aln.sam.gz

# and converted sam to sorted bam in samtools
# in /analyses/03_binning/01_metabat
# -o /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220421_RR4342129_aln_sorted.bam
# -o /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220421_RR4342133_aln_sorted.bam

# Binning each assembly
# One at a time in two scripts due to lack of memory issues
# Call: /sw/apps/bioinfo/MetaBat/2.12.1/rackham/runMetaBat.sh <select metabat options> assembly.fa sample1.bam [ sample2.bam ...]/sw/apps/bioinfo/MetaBat/2.12.1/rackham/runMetaBat.sh <select metabat options> assembly.fa sample1.bam [ sample2.bam ...]
# -t 2 -m 1500 -v --unbinned

/sw/apps/bioinfo/MetaBat/2.12.1/rackham/runMetaBat.sh \
-t 2 \
-m 1500 \
-v \
--unbinned \
/home/tola2495/GenomeAnalysisVT2022/analyses/02_dna_assembly/01_megahit/220410_RR4342129_dna_assembly.megahit_asm/final.contigs.fa \
/home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220421_RR4342129_aln_sorted.bam



