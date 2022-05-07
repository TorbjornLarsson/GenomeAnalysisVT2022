#!/bin/bash -l

# Load modules
module load bioinfo-tools
module load phylophlan/0.99

# set this to the directory where you want to store your phylophlan results
outdir="/home/tola2495/GenomeAnalysisVT2022/analyses/04_phylogenetic_placement/phylophlan"
cd $outdir

# Now we want to run a local clean of PhyloPhlan project final and temporary data due to limited memory resources. 
# phylophlan.py  --clean metagenome

phylophlan.py \
--clean \
metagenome

