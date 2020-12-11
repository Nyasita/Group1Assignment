#!/bin/bash
#Usage: mkdir - to make new directories, wget - to download sequences, awk and grep - for pattern searching, wc - for counting


#QN1:Create a new project, complete with all directories
mkdir group1assignment
cd group1assignment
mkdir bashcommands
cd bashcommands

#QN2:download and uncompress the data into the appropriate directory
wget https://github.com/kipkurui/Intro2Linux2019/raw/master/Data/protein.fa.gz
gunzip protein.fa.gz

#QN3:create a new FASTA file which only contains uncharacterized proteins
awk '{RS=">";FS="\n"}; {if ($1~/uncharacterized/) print RS$0}' protein.fa > uncharacterized.fa

#QN4:create a clean FASTA file without uncharacterized sequences
grep -v "uncharacterized" protein.fa > clean.fa  #alternatively the command awk '{RS=""}{gsub(/\n/," ", $0) print $0}' can be used for this question

#QN5:create a new file which only contains raw sequences without the identifying information, or new lines
grep -v ">" protein.fa | tr -d "\n" > oneline.fa 

#QN6:Number of amino acids are in this new file
wc -c oneline.fa

