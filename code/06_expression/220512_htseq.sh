#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load htseq/0.12.4

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
# Station D1
# /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342129/final.contigs.fa.metabat-bins--unbinned
# Station D3
# /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342133/final.contigs.fa.metabat-bins--unbinned

# The samples had its rna reads annotated to binned contigs in bwa with post-mapping analysis in samtools to produce ordered bam files.
#
# Trimmed paired end rna reads
# Station D1
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_1P.fq.gz
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_2P.fq.gz
#  ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342129/$(basename "$RR4342129_file" .fa)_sorted.bam
# Station D3
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_1P.fq.gz
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_2P.fq.gz
# ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342133/$(basename "$RR4342133_file" .fa)_sorted.bam
#
# And the prokka gff files has had its ##FASTA lines removed and a random half, here Bacteria,
# has been moved into sample subfolders in the htseq work folder.
# /home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq

# Now we want to run HTSeq to count the mapped reads.
# Calls: htseq-count -n 2 --mode union --order pos -type CDS --idattr ID --counts_output OUTPUT_FILENAME <alignment_file> <gff_file>

echo true

# Station D1 samples
cd /home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq/RR4342129
for alignment_file in /home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342129/*.bam
do
file=$(basename "$alignment_file")
echo "$file"
IFS='_' list=($file)
bin=${list[0]}"_"${list[1]}
gff_file=/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq/RR4342129/RR4342129_Bacteria_"$bin".gff
echo "$gff_file"
count_file=/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq/RR4342129/RR4342129_"$bin".cnt
echo "$count_file"
htseq-count -n 2 -m union -o pos -t CDS -i ID \
-c "$count_file" \
"$alignment_file" \
"$gff_file"
done

# Station D3 samples
cd /home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq/RR4342133
for alignment_file in /home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342133/*.bam
do
file=$(basename "$alignment_file")
echo "$file"
IFS='_' list=($file)
bin=${list[0]}"_"${list[1]}
gff_file=/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq/RR4342133/RR4342133_Bacteria_"$bin".gff
echo "$gff_file"
count_file=/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq/RR4342133/RR4342133_"$bin".cnt
echo "$count_file"
htseq-count -n 2 -m union -o pos -t CDS -i ID \
-c "$count_file" \
"$alignment_file" \
"$gff_file"
done

