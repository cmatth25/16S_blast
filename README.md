# 16S_blast
speed up 16S ID
for use in compute Canada. Change db for local HPC

blast_all.sh returns top blast hit for each sequence for input multifasta
head_blast.sh adds top blast hit info to multifasta header

both take 1 arg, the multifasta (3 letter ext .fna)

blast_1 takes 1 directory as arg (no following "/") and returns txt files with top 10 hits for each individual fasta (again .fna) 
