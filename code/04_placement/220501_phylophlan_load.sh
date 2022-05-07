#!/bin/bash -l

# Load modules
module load bioinfo-tools
module load phylophlan/0.99
module unload python
module load biopython/1.73 usearch/5.2.32 muscle/3.8.31

# set this to the directory where you want to store your phylophlan results
outdir="/home/tola2495/GenomeAnalysisVT2022/analyses/04_phylogenetic_placement/phylophlan"
cd $outdir

# Phyloplan call: phylophlan.py
phylophlan.py -h > help.txt



