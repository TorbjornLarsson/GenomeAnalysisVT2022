#!/bin/bash -l
#SBATCH -A uppmax2022-2-5
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 08:00:00
#SBATCH -J phylophlan
#SBATCH --mail-type=ALL
#SBATCH --mail-user tola2495@student.uu.se

# Load modules
module load bioinfo-tools
module load phylophlan/0.99
module unload python
module load biopython/1.73 usearch/5.2.32 muscle/3.8.31 FastTree/2.1.10

# set this to the directory where you want to store your phylophlan results
outdir="/home/tola2495/GenomeAnalysisVT2022/analyses/04_phylogenetic_placement/phylophlan"
# create the directories that phylophlan looks for:
# when you run phylophlan you specify a project name, which it looks for in the "input" directory
# in this case the project name is "metagenome"
# this is also where you should put symlinks to your input files
# mkdir -p $outdir/input/metagenome
# mkdir -p $outdir/output
# mkdir -p $outdir/data/ppaalns
# symlink phylophlan data files
# ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/data/*.bz2 $outdir/data/
# ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/data/ppaalns/*.bz2 $outdir/data/ppaalns/
# ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/data/ppafull.tax.txt $outdir/data/
# ln -sf /sw/apps/bioinfo/phylophlan/0.99/rackham/bin/taxcuration/ $outdir/taxcuration
cd $outdir

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

# Annotated into
# ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Bacteria
# ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea
# ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Bacteria
# ~/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea

# Now we want to run PhyloPhlan placement. 
# The annotation bins .faa gene annotations were copied into the UPPMAX PhyloPlan 0.99
# project forced folder name 
# ~/GenomeAnalysisVT2022/analyses/04_placement/phylophlan/input/metagenome
# and bin renamed with sample_kingdom_bin_N.faa.
# phylophlan.py  --integrate --taxonomic_analysis --nproc 2 metagenome

phylophlan.py \
--integrate \
--taxonomic_analysis \
--nproc 8 \
metagenome

