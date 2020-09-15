#!/bin/bash

#bash variables
allfiles=$(ls *.ht2)

wc -l $allfiles

#loops structure
for (variable_name) in (list)
do
(command1 $variable_name)
.
.
done

#loop example
for num in $(seq 1 1 100)
do
touch gene-${num}-expression.txt
done

#base name
basename basename ~/data/mmrRNA/mouse_rRNA.fa #the command returns only the filename mouse_rRNA.fa
basename ~/data/mmrRNA/mouse_rRNA.fa .fa # trim off the file extension and leave only the file base name

#automating with scripts
for filename in *.fq
do
#create a prefix for all output files
base=$(basename $filename .fq)
#tell us what file we are working on
echo $filename
#grab all the bad read records into new file
grep -B1 A2 NNNNNNNN $filename > ${base}-badreads.fastq
#grab the number of bad reads and write it to a summary file
#-H falg will report the filename along with the match string
grep -cH NNNNNNN $filename >> badreads.count.summary
done




