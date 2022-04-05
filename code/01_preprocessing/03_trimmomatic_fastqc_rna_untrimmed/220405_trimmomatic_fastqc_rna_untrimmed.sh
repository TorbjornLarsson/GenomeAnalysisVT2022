#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 04:00:00
#SBATCH -J trim_qc
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load trimmomatic/0.39 FastQC/0.11.8

# Trimming 2 set of raw rna paired_end reads
# Sequenced in Illumina HiSeq 2000
trimmomatic PE -version -threads 2 -trimlog /home/tola2495/GenomeAnalysisVT2022/analyses/01_preprocessing/rna/02_trimming/RR4342137trimLogFile -summary /home/tola2495/GenomeAnalysisVT2022/analyses/01_preprocessing/rna/02_trimming/RR4342137statsSummaryFile \
/home/tola2495/GenomeAnalysisVT2022/data/raw_data/rna_untrimmed/RR4342137.1.fastq.gz /home/tola2495/GenomeAnalysisVT2022/data/raw_data/rna_untrimmed/RR4342137.2.fastq.gz -baseout /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed.fq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:50 AVGQUAL:20 MAXINFO:50:0.5

trimmomatic PE -version -threads 2 -trimlog /home/tola2495/GenomeAnalysisVT2022/analyses/01_preprocessing/rna/02_trimming/RR4342139trimLogFile -summary /home/tola2495/GenomeAnalysisVT2022/analyses/01_preprocessing/rna/02_trimming/RR4342139statsSummaryFile \
/home/tola2495/GenomeAnalysisVT2022/data/raw_data/rna_untrimmed/RR4342139.1.fastq.gz /home/tola2495/GenomeAnalysisVT2022/data/raw_data/rna_untrimmed/RR4342139.2.fastq.gz -baseout /home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed.fq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:50 AVGQUAL:20 MAXINFO:50:0.5

# Quality analysis of result
fastqc \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_1P.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_1U.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_2P.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342137.paired.trimmed_2U.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_1P.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_1U.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_2P.fq.gz \
/home/tola2495/GenomeAnalysisVT2022/data/trimmed_data/rna/RR4342139.paired.trimmed_2U.fq.gz \
-o /home/tola2495/GenomeAnalysisVT2022/analyses/01_preprocessing/rna/03_fastqc_trim
