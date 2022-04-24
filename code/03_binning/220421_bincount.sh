#!/bin/bash -l

# Count contigs in bin files

sum1=
binnames=`ls /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342129/final.contigs.fa.metabat-bins--unbinned/*.fa`
for eachfile in $binnames
do
   echo $eachfile >> RR4342129_bin_count.txt
   cat $eachfile | grep ">" | wc -l >> RR4342129_bin_count.txt
   sum1=$((sum1 + $(cat $eachfile | grep ">" | wc -l)))
   printf "\n" >> RR4342129_bin_count.txt
done
echo $sum1 >> RR4342129_bin_count.txt
printf "\n" >> RR4342129_bin_count.txt

sum2=
binnames=`ls /home/tola2495/GenomeAnalysisVT2022/analyses/03_binning/01_metabat/220422_metabat_RR4342133/final.contigs.fa.metabat-bins--unbinned/*.fa`
for eachfile in $binnames
do
   echo $eachfile >> RR4342133_bin_count.txt
   cat $eachfile | grep ">" | wc -l >> RR4342133_bin_count.txt
   sum2=$((sum2 + $(cat $eachfile | grep ">" | wc -l)))
   printf "\n" >> RR4342133_bin_count.txt
done
echo $sum2 >> RR4342133_bin_count.txt
printf "\n" >> RR4342133_bin_count.txt




