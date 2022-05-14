#!/bin/bash -l

# Copy .gff files from annotation to expression folders with removing fasta.
# Rename files from Prokka output for HTSeq.
# that match with the folder pattern .fa from "${dir}${file}" to "$filedir" without the .fa suffix. 
# Call: cp "${dir}${file}" <target_folder> mv <target_folder>/"$file" "$(basename file$dir .fa)" 

cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Archaea
echo "$PWD"
dirs=($PWD/*/)
for dir in "${dirs[@]}"
do
echo "$dir"
cd $dir
for file in *.gff
do
cp $file ../
first=$(grep -n -m 1 '##FASTA' $file | cut -d ":" -f 1)
echo "$first"
head -n $first $file > ../result.gff
tg1="$(basename $file .gff)"
tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq"
tg3="${tg2}/${tg1}_$(basename $dir .fa).gff"
echo "$tg3"
mv ../result.gff "$tg3"
done
done

cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Bacteria
echo "$PWD"
dirs=($PWD/*/)
for dir in "${dirs[@]}"
do
echo "$dir"
cd $dir
for file in *.gff
do
cp $file ../
first=$(grep -n -m 1 '##FASTA' ../$file | cut -d ":" -f 1)
echo "$first"
head -n $first ../$file > ../result.gff
tg1="$(basename $file .gff)"
tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq"
tg3="${tg2}/${tg1}_$(basename $dir .fa).gff"
echo "$tg3"
mv ../result.gff "$tg3"
done
done

cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea
echo "$PWD"
dirs=($PWD/*/)
for dir in "${dirs[@]}"
do
echo "$dir"
cd $dir
for file in *.gff
do
cp $file ../
first=$(grep -n -m 1 '##FASTA' ../$file | cut -d ":" -f 1)
echo "$first"
head -n $first ../$file > ../result.gff
tg1="$(basename $file .gff)"
tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq"
tg3="${tg2}/${tg1}_$(basename $dir .fa).gff"
echo "$tg3"
mv ../result.gff "$tg3"
done
done

cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Bacteria
echo "$PWD"
dirs=($PWD/*/)
for dir in "${dirs[@]}"
do
echo "$dir"
cd $dir
for file in *.gff
do
cp $file ../
first=$(grep -n -m 1 '##FASTA' ../$file | cut -d ":" -f 1)
echo "$first"
head -n $first ../$file > ../result.gff
tg1="$(basename $file .gff)"
tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/06_expression/htseq"
tg3="${tg2}/${tg1}_$(basename $dir .fa).gff"
echo "$tg3"
mv ../result.gff "$tg3"
done
done

