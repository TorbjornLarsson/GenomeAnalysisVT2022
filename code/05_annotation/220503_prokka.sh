#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J prokka
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load prokka/1.45-5b58020

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

# And binned separately with result moved to
# /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342129/final.contigs.fa.metabat-bins--unbinned
# /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342133/final.contigs.fa.metabat-bins--unbinned

# Now we want to annotate each bin features in Prokka.
# We go through each bin twice, first for default kingdom Bacteria, then for Archaea.
# Option  --metagenome improve gene predictions for highly fragmented genomes.
# Call: prokka --metagenome --cpus 2 --prefix <kingdom> --outdir mydir contigs.fa

mkdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Bacteria
cd ~/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342129/final.contigs.fa.metabat-bins--unbinned
for RR4342129_file in *.fa
do
prokka \
--metagenome \
--cpus 2 \
--prefix RR4342129_Bacteria \
--outdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Bacteria/"$RR4342129_file" \
$RR4342129_file
done

mkdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Archaea
for RR4342129_file in *.fa
do
prokka \
--metagenome \
--cpus 2 \
--kingdom Archaea \
--prefix RR4342129_Archaea \
--outdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Archaea/"$RR4342129_file" \
$RR4342129_file
done

mkdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Bacteria
cd ~/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342133/final.contigs.fa.metabat-bins--unbinned
for RR4342133_file in *.fa
do
prokka \
--metagenome \
--cpus 2 \
--prefix RR4342133_Bacteria \
--outdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Bacteria/"$RR4342133_file" \
$RR4342133_file
done

mkdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea
for RR4342133_file in *.fa
do
prokka \
--metagenome \
--cpus 2 \
--kingdom Archaea \
--prefix RR4342133_Archaea \
--outdir ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea/"$RR4342133_file" \
$RR4342133_file
done
