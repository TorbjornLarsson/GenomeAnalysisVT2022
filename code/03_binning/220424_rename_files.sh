#!/bin/bash -l

# Rename files from Metabat output for CheckM input
# that match with the pattern
# rename bin. bin_ bin*


PATH='/home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342129/final.contigs.fa.metabat-bins--unbinned'
cd ${PATH}
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/rename
$(rename bin. bin_ bin*)

PATH='/home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342133/final.contigs.fa.metabat-bins--unbinned'
cd ${PATH}
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/rename
$(rename bin. bin_ bin*)

