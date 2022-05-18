#!/bin/bash -l

# Now we want to tree the largest group of bins that were annotated as Nitrosopumilales
# and had placed together with short branches in the placement tree, 
# as well as have a set of syntenic genes from the same operon. I.e. L3, L5, L6 are found in 5 of 9 bins.
# We collect the following CDS for the following bins:
# RR4342129_Archaea_bin_2
# RR4342129_Archaea_bin_24
# RR4342133_Archaea_bin_11
# RR4342133_Archaea_bin_18
# RR4342133_Archaea_bin_24
#
# As well as 5 Nitrosopumilus and 3 other Thaumarchaeota as well as 1 Euryarchaeota outgroup 
# in files ref1 and ref2 respectively (where the latter was converted from fna to faa in ExPASy translate tool).
# 
# First we collect the L3 sequences with headers

out=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/concatenate.faa
echo $out

# file1.fa, file2.fa, result.txt  work files
in1=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_2_L3_ref1.fasta
in2=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_2_L5_ref1.fasta
in3=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_2_L6_ref1.fasta

in4=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/outgroup_L3.fasta
in5=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/outgroup_L5.fasta
in6=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/outgroup_L6.fasta

in7=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_2_L3.faa
in8=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_2_L5.faa
in9=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_2_L6.faa

in10=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_24_L3.faa
in11=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_24_L5.faa
in12=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342129_bin_24_L6.faa

in13=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_11_L3.faa
in14=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_11_L5.faa
in15=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_11_L6.faa

in16=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_18_L3.faa
in17=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_18_L5.faa
in18=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_18_L6.faa

in19=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_24_L3.faa
in20=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_24_L5.faa
in21=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/RR4342133_bin_24_L6.faa

#>MAI01613.1 50S ribosomal protein L3 [Nitrosopumilus sp.]
#>WP_179360016.1 50S ribosomal protein L3 [Nitrosopumilus cobalaminigenes]
#>WP_179361906.1 50S ribosomal protein L3 [Nitrosopumilus oxyclinae]
#>WP_179372802.1 50S ribosomal protein L3 [Nitrosopumilus ureiphilus]
#>KAG2480419.1 50S ribosomal protein L3 [Nitrosopumilales archaeon]
#>WP_048105298.1 50S ribosomal protein L3 [Candidatus Nitrosopelagicus brevis]
#>WP_101478086.1 50S ribosomal protein L3 [Candidatus Nitrosotalea bavarica]
#>HIQ29555.1 50S ribosomal protein L3 [Candidatus Caldarchaeum subterraneum]

# Nitrosopumilus sp.

# L3_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">MAI01613.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Nitrosopumilus sp.' file2.fa
cat file2.fa > result.txt

#>WP_048105276.1 50S ribosomal protein L5 [Candidatus Nitrosopelagicus brevis]
#>MBT8172987.1 50S ribosomal protein L5 [Nitrosopumilus sp.]
#>WP_179372791.1 50S ribosomal protein L5 [Nitrosopumilus ureiphilus]
#>KAG0511386.1 50S ribosomal protein L5 [Nitrosopumilales archaeon]
#>WP_179360028.1 50S ribosomal protein L5 [Nitrosopumilus cobalaminigenes]
#>WP_101478132.1 50S ribosomal protein L5 [Candidatus Nitrosotalea bavarica]
#>WP_179361918.1 50S ribosomal protein L5 [Nitrosopumilus oxyclinae]
#>HHK67772.1 50S ribosomal protein L5 [Candidatus Caldarchaeum subterraneum]

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">MBT8172987.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

#>RCL31069.1 50S ribosomal protein L6 [Nitrosopumilus sp.]
#>WP_179361920.1 50S ribosomal protein L6 [Nitrosopumilus oxyclinae]
#>WP_179360030.1 50S ribosomal protein L6 [Nitrosopumilus cobalaminigenes]
#>WP_179372789.1 50S ribosomal protein L6 [Nitrosopumilus ureiphilus]
#>KAG2480088.1 50S ribosomal protein L6 [Nitrosopumilales archaeon]
#>WP_048105268.1 50S ribosomal protein L6 [Candidatus Nitrosopelagicus brevis]
#>WP_101478100.1 50S ribosomal protein L6 [Candidatus Nitrosotalea bavarica]
#>HHK67769.1 50S ribosomal protein L6 [Candidatus Caldarchaeum subterraneum]

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">RCL31069.1" file1.fa | tail -n +2 >> result.txt

# Nitrosopumilus cobalaminigenes

# L3_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">WP_179360016.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Nitrosopumilus cobalaminigenes' file2.fa
cat file2.fa >> result.txt

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">WP_179360028.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">WP_179360030.1" file1.fa | tail -n +2 >> result.txt

# Nitrosopumilus oxyclinae

# L3_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">WP_179361906.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Nitrosopumilus oxyclinae' file2.fa
cat file2.fa >> result.txt

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">WP_179361918.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">WP_179361920.1" file1.fa | tail -n +2 >> result.txt

# Nitrosopumilus ureiphilus

# L3_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">WP_179372802.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Nitrosopumilus ureiphilus' file2.fa
cat file2.fa >> result.txt

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">WP_179372791.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">WP_179372789.1" file1.fa | tail -n +2 >> result.txt

# Nitrosopumilales archaeon

# L3_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">KAG2480419.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Nitrosopumilales archaeon' file2.fa
cat file2.fa >> result.txt

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">KAG0511386.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">KAG2480088.1" file1.fa | tail -n +2 >> result.txt

# Candidatus Nitrosopelagicus brevis

# L3_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">WP_048105298.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Candidatus Nitrosopelagicus brevis' file2.fa
cat file2.fa >> result.txt

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">WP_048105276.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">WP_048105268.1" file1.fa | tail -n +2 >> result.txt

# Candidatus Nitrosotalea bavarica

# L3_ref1.fast
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">WP_101478086.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Candidatus Nitrosotalea bavarica' file2.fa
cat file2.fa >> result.txt

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">WP_101478132.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">WP_101478100.1" file1.fa | tail -n +2 >> result.txt

# Candidatus Caldarchaeum subterraneum

# L3_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in1 > file1.fa
LC_ALL=C grep -A 1 ">HIQ29555.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Candidatus Caldarchaeum subterraneum' file2.fa
cat file2.fa >> result.txt

# L5_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in2 > file1.fa
LC_ALL=C grep -A 1 ">HHK67772.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6_ref1.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in3 > file1.fa
LC_ALL=C grep -A 1 ">HHK67769.1" file1.fa | tail -n +2 >> result.txt

# Euryarchaeota outgroup
# outgroup_L3.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in4 > file1.fa
LC_ALL=C grep -A 1 ">lcl|NZ_AP025587.1" file1.fa | head -c -1 > file2.fa
sed -i '1c\>Methanobrevibacter smithii' file2.fa
cat file2.fa >> result.txt

# outgroup_L5.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in5 > file1.fa
LC_ALL=C grep -A 1 ">lcl|NZ_AP025587.1" file1.fa | tail -n +2 | head -c -1 >> result.txt

# outgroup_L6.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in6 > file1.fa
LC_ALL=C grep -A 1 ">lcl|NZ_AP025587.1" file1.fa | tail -n +2 >> result.txt

#RR4342129_bin_2

# L3.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in7 > file1.fa
LC_ALL=C grep -A 1 ">MMNBELJE_00324" file1.fa | head -c -1 > file2.fa
sed -i '1c\>RR4342129_bin_2' file2.fa
cat file2.fa >> result.txt

# L5.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in8 > file1.fa
LC_ALL=C grep -A 1 ">MMNBELJE_00342" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in9 > file1.fa
LC_ALL=C grep -A 1 ">MMNBELJE_00345" file1.fa | tail -n +2 >> result.txt

# RR4342129_bin_24

# L3.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in10 > file1.fa
LC_ALL=C grep -A 1 ">FCDLKJEA_00016" file1.fa | head -c -1 > file2.fa
sed -i '1c\>RR4342129_bin_24' file2.fa
cat file2.fa >> result.txt

# L5.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in11 > file1.fa
LC_ALL=C grep -A 1 ">FCDLKJEA_00006" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in12 > file1.fa
LC_ALL=C grep -A 1 ">FCDLKJEA_00009" file1.fa | tail -n +2 >> result.txt

# RR4342133_bin_11

# L3.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in13 > file1.fa
LC_ALL=C grep -A 1 ">GNOBGONP_01711" file1.fa | head -c -1 > file2.fa
sed -i '1c\>RR4342133_bin_11' file2.fa
cat file2.fa >> result.txt

# L5.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in14 > file1.fa
LC_ALL=C grep -A 1 ">GNOBGONP_03730" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in15 > file1.fa
LC_ALL=C grep -A 1 ">GNOBGONP_03732" file1.fa | tail -n +2 >> result.txt

# RR4342133_bin_18

# L3.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in16 > file1.fa
LC_ALL=C grep -A 1 ">PKBBMBJJ_00854" file1.fa | head -c -1 > file2.fa
sed -i '1c\>RR4342133_bin_18' file2.fa
cat file2.fa >> result.txt

# L5.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in17 > file1.fa
LC_ALL=C grep -A 1 ">PKBBMBJJ_00406" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in18 > file1.fa
LC_ALL=C grep -A 1 ">PKBBMBJJ_00403" file1.fa | tail -n +2 >> result.txt

# RR4342133_bin_24

# L3.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in19 > file1.fa
LC_ALL=C grep -A 1 ">MOPFLJEK_00282" file1.fa | head -c -1 > file2.fa
sed -i '1c\>RR4342133_bin_24' file2.fa
cat file2.fa >> result.txt

# L5.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in20 > file1.fa
LC_ALL=C grep -A 1 ">MOPFLJEK_00570" file1.fa | tail -n +2 | head -c -1 >> result.txt

# L6.fasta
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $in21 > file1.fa
LC_ALL=C grep -A 1 ">MOPFLJEK_00755" file1.fa | tail -n +2 >> result.txt

