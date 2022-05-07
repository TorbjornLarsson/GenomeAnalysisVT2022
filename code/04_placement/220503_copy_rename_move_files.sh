#!/bin/bash -l

# Copy .faa files from annotation to placement folders with renaming.
# Rename files from Prokka output for PhylPhlan input
# that match with the folder pattern .fa from "${dir}${file}" to "$filedir" without the .fa suffix. 
# Call: cp "${dir}${file}" <target_folder> mv <target_folder>/"$file" "$(basename file$dir .fa)" 

#cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Archaea
#echo "$PWD"
#dirs=($PWD/*/)
#for dir in "${dirs[@]}"
#do
#echo "$dir"
#cd $dir
#for file in *.faa
#do
#cp $file ../
#tg1="$(basename $file .faa)"
#tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/04_placement/phylophlan/input/metagenome"
#tg3="${tg2}/${tg1}_$(basename $dir .fa).faa"
#echo "$tg3"
#mv ../"$file" "$tg3"
#done
#done

cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342129_Bacteria
echo "$PWD"
dirs=($PWD/*/)
for dir in "${dirs[@]}"
do
echo "$dir"
cd $dir
for file in *.faa
do
cp $file ../
tg1="$(basename $file .faa)"
tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/04_placement/phylophlan/input/metagenome"
tg3="${tg2}/${tg1}_$(basename $dir .fa).faa"
echo "$tg3"
mv ../"$file" "$tg3"
done
done

cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Archaea
echo "$PWD"
dirs=($PWD/*/)
for dir in "${dirs[@]}"
do
echo "$dir"
cd $dir
for file in *.faa
do
cp $file ../
tg1="$(basename $file .faa)"
tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/04_placement/phylophlan/input/metagenome"
tg3="${tg2}/${tg1}_$(basename $dir .fa).faa"
echo "$tg3"
mv ../"$file" "$tg3"
done
done

cd /home/tola2495/GenomeAnalysisVT2022/analyses/05_annotation/prokka/RR4342133_Bacteria
echo "$PWD"
dirs=($PWD/*/)
for dir in "${dirs[@]}"
do
echo "$dir"
cd $dir
for file in *.faa
do
cp $file ../
tg1="$(basename $file .faa)"
tg2="/home/tola2495/GenomeAnalysisVT2022/analyses/04_placement/phylophlan/input/metagenome"
tg3="${tg2}/${tg1}_$(basename $dir .fa).faa"
echo "$tg3"
mv ../"$file" "$tg3"
done
done

