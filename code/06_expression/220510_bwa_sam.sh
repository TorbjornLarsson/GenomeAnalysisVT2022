#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J bwa_sam
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa/0.7.17 samtools/1.14

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

# Now we want to annotate rna reads to binned contigs in bwa and do post-mapping analysis in samtools.
# Trimmed paired end rna reads
# Station D1
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_1P.fq.gz
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_2P.fq.gz
# Station D3
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_1P.fq.gz
# /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_2P.fq.gz
# Calls:
# bwa index ref.fa
# bwa mem -t 2 ref.fa read1.fq read2.fq > aln-pe.sam
# samtools view -@ 1 -uh <ALIGNMENT.sam> | samtools sort -@ 1 - -o <ALIGNMENT_SORTED.bam>
# samtools index -@ 1 <ALIGNMENT_SORTED>.bam
# samtools flagstat -@ 1 <ALIGNMENT_SORTED>.bam

# Station D1 samples
mkdir ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342129
cd ~/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342129/final.contigs.fa.metabat-bins--unbinned
for RR4342129_file in *.fa
do
bwa index $RR4342129_file
bwa mem -t 2 $RR4342129_file \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_1P.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_2P.fq.gz | \
samtools view -@ 1 --with-header - | \
samtools sort -@ 1 - -o ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342129/$(basename "$RR4342129_file" .fa)_sorted.bam
samtools index -@ 1 ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342129/$(basename "$RR4342129_file" .fa)_sorted.bam
samtools flagstat -@ 1 ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342129/$(basename "$RR4342129_file" .fa)_sorted.bam
done

# Station D3 samples
mkdir ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342133
cd ~/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342133/final.contigs.fa.metabat-bins--unbinned
for RR4342133_file in *.fa
do
bwa index $RR4342133_file
bwa mem -t 2 $RR4342133_file \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_1P.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_2P.fq.gz | \
samtools view -@ 1 --with-header - | \
samtools sort -@ 1 - -o ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342133/$(basename "$RR4342133_file" .fa)_sorted.bam
samtools index -@ 1 ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342133/$(basename "$RR4342133_file" .fa)_sorted.bam
samtools flagstat -@ 1 ~/GenomeAnalysisVT2022/analyses/06_expression/bwa/RR4342133/$(basename "$RR4342133_file" .fa)_sorted.bam
done
