#!/bin/bash -l

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

# The bins have had their genomes annotated in prokka.
# /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Archaea
# /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea

# Now we want to collect the largest group of bins that were annotated as Nitrosopumilales
# and had placed together with short branches in the placement tree, 
# as well as have a set of syntenic genes from the same operon. I.e. L3, L5, L6 are found in 5 of 9 bins.
# From those we want to collect the following CDS:

# RR4342129_Archaea_bin_2
# MMNBELJE_00324    CDS    996    rpl3        COG0087    50S ribosomal protein L3
# MMNBELJE_00342    CDS    522    rpl5        COG0094    50S ribosomal protein L5
# MMNBELJE_00345    CDS    558    rpl6        COG0097    50S ribosomal protein L6

# RR4342129_Archaea_bin_24
# FCDLKJEA_00006    CDS    522    rpl5_1        COG0094    50S ribosomal protein L5
# FCDLKJEA_00009    CDS    558    rpl6        COG0097    50S ribosomal protein L6
# FCDLKJEA_00016    CDS    747    rpl3_1        COG0087    50S ribosomal protein L3

# RR4342133_Archaea_bin_11
# GNOBGONP_01711    CDS    993    rpl3_1        COG0087    50S ribosomal protein L3
# GNOBGONP_03730    CDS    522    rpl5_2        COG0094    50S ribosomal protein L5
# GNOBGONP_03732    CDS    558    rpl6_2        COG0097    50S ribosomal protein L6

# RR4342133_Archaea_bin_18
# PKBBMBJJ_00854    CDS    996    rpl3        COG0087    50S ribosomal protein L3
# PKBBMBJJ_00406    CDS    498    rpl5        COG0094    50S ribosomal protein L5
# PKBBMBJJ_00403    CDS    558    rpl6        COG0097    50S ribosomal protein L6

# RR4342133_Archaea_bin_24
# MOPFLJEK_00282    CDS    996    rpl3        COG0087    50S ribosomal protein L3
# MOPFLJEK_00570    CDS    522    rpl5        COG0094    50S ribosomal protein L5
# MOPFLJEK_00755    CDS    558    rpl6_3        COG0097    50S ribosomal protein L6

# Station D1 samples
# RR4342129_Archaea_bin_2
# MMNBELJE_00324    CDS    996    rpl3        COG0087    50S ribosomal protein L3
# MMNBELJE_00342    CDS    522    rpl5        COG0094    50S ribosomal protein L5
# MMNBELJE_00345    CDS    558    rpl6        COG0097    50S ribosomal protein L6

# Declare arrays of string with type
declare -a namearray=("L3" "L5" "L6")

# Iterate the string arrays using for loop
declare -a cdsarray=("MMNBELJE_00324" "MMNBELJE_00342" "MMNBELJE_00345")

file=/home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Archaea/bin_2.fa/*.faa
name=RR4342129_bin_2

for n in 0 1 2
do

gene=${namearray[n]}
echo $gene

out=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/"$name"_"$gene".faa
echo $out

val=${cdsarray[n]}
echo $val

awk -v seq=$val -v RS='>' '$1 == seq {print RS $0}' $file > $out
#sed -i ':a;N;$!ba;s/\n//g' $out
done

# Iterate the string arrays using for loop
# RR4342129_Archaea_bin_24
# FCDLKJEA_00006    CDS    522    rpl5_1        COG0094    50S ribosomal protein L5
# FCDLKJEA_00009    CDS    558    rpl6        COG0097    50S ribosomal protein L6
# FCDLKJEA_00016    CDS    747    rpl3_1        COG0087    50S ribosomal protein L3

declare -a cdsarray=("FCDLKJEA_00016" "FCDLKJEA_00006" "FCDLKJEA_00009")

file=/home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Archaea/bin_24.fa/*.faa
name=RR4342129_bin_24

for n in 0 1 2
do

gene=${namearray[n]}
echo $gene

out=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/"$name"_"$gene".faa
echo $out

val=${cdsarray[n]}
echo $val

awk -v seq=$val -v RS='>' '$1 == seq {print RS $0}' $file > $out
#sed -i ':a;N;$!ba;s/\n//g' $out
done

# RR4342133_Archaea_bin_11
# GNOBGONP_01711    CDS    993    rpl3_1        COG0087    50S ribosomal protein L3
# GNOBGONP_03730    CDS    522    rpl5_2        COG0094    50S ribosomal protein L5
# GNOBGONP_03732    CDS    558    rpl6_2        COG0097    50S ribosomal protein L6

declare -a cdsarray=("GNOBGONP_01711" "GNOBGONP_03730" "GNOBGONP_03732")

file=/home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea/bin_11.fa/*.faa
name=RR4342133_bin_11

for n in 0 1 2
do

gene=${namearray[n]}
echo $gene

out=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/"$name"_"$gene".faa
echo $out

val=${cdsarray[n]}
echo $val

awk -v seq=$val -v RS='>' '$1 == seq {print RS $0}' $file > $out
#sed -i ':a;N;$!ba;s/\n//g' $out
done

# RR4342133_Archaea_bin_18
# PKBBMBJJ_00854    CDS    996    rpl3        COG0087    50S ribosomal protein L3
# PKBBMBJJ_00406    CDS    498    rpl5        COG0094    50S ribosomal protein L5
# PKBBMBJJ_00403    CDS    558    rpl6        COG0097    50S ribosomal protein L6

declare -a cdsarray=("PKBBMBJJ_00854" "PKBBMBJJ_00406" "PKBBMBJJ_00403")

file=/home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea/bin_18.fa/*.faa
name=RR4342133_bin_18

for n in 0 1 2
do

gene=${namearray[n]}
echo $gene

out=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/"$name"_"$gene".faa
echo $out

val=${cdsarray[n]}
echo $val

awk -v seq=$val -v RS='>' '$1 == seq {print RS $0}' $file > $out
#sed -i ':a;N;$!ba;s/\n//g' $out
done

# RR4342133_Archaea_bin_24
# MOPFLJEK_00282    CDS    996    rpl3        COG0087    50S ribosomal protein L3
# MOPFLJEK_00570    CDS    522    rpl5        COG0094    50S ribosomal protein L5
# MOPFLJEK_00755    CDS    558    rpl6_3        COG0097    50S ribosomal protein L6

declare -a cdsarray=("MOPFLJEK_00282" "MOPFLJEK_00570" "MOPFLJEK_00755")

file=/home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea/bin_24.fa/*.faa
name=RR4342133_bin_24

for n in 0 1 2
do

gene=${namearray[n]}
echo $gene

out=/home/tola2495/GenomeAnalysisVT2022/analyses/09_refineID/"$name"_"$gene".faa
echo $out

val=${cdsarray[n]}
echo $val

awk -v seq=$val -v RS='>' '$1 == seq {print RS $0}' $file > $out
#sed -i ':a;N;$!ba;s/\n//g' $out
done



