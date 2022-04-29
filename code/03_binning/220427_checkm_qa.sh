#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 2:00:00
#SBATCH -J checkm_qa
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se
#SBATCH --reservation=uppmax2022-2-5_6

# Load modules
module load bioinfo-tools
module load CheckM/1.1.3

# Set CheckM database location
checkm data setRoot /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/CheckM_data/2015_01_16

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

# We have checked each assembly separately with CheckM, now we want to assess bins for contamination and completeness.
# We read the bin fasta files after having renamed them for CheckM by running a script that replaced the leading dot with underscore.
# CheckM also assumes genomes is nucleotides with files ending with the extension fna, so we use -x to tell what we run.
# For the output -o we want the extended summary of bin quality (includes GC, genome size, coding density, ...).
# Call: checkm qa -t 2 -x fa --file FILE <marker file> <output folder>  

checkm qa \
 -t 2 \
 --file /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342129/RR4342129_checkm_qa.txt \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342129/lineage.ms \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342129

checkm qa \
 -t 2 \
 --file /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342133/RR4342133_checkm_qa.txt \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342133/lineage.ms \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342133



