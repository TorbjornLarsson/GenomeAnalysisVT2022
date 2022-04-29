#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 02:00:00
#SBATCH -J checkm
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

# Now we want to check each assembly separately with CheckM.
# We read the bin fasta files after having renamed them for CheckM by running a script that replaced the leading dot with underscore.
# CheckM also assumes genomes is nucleotides with files ending with the extension fna, so we use -x to tell what we run.
# Since we start with the memory intensive “lineage_wf” analysis, we use 4 cores and the flag “--reduced_tree”.
# Call: checkm  -t 4 -x fa --reduced_tree lineage_wf <bin folder> <output folder>  

checkm lineage_wf \
 -t 4 \
 -x fa \
 --reduced_tree \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342129/final.contigs.fa.metabat-bins--unbinned \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342129

checkm lineage_wf \
 -t 4 \
 -x fa \
 --reduced_tree \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342133/final.contigs.fa.metabat-bins--unbinned \
 /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/02_checkm/220426_checkm_RR4342133



