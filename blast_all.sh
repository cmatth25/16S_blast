#!/bin/bash

#SBATCH --time=00:15:00       
#SBATCH --cpus-per-task=1     
#SBATCH --mem-per-cpu=100GB    
#SBATCH --output=blast_1.%J.out
#SBATCH --error=blast_1.%J.err

module load StdEnv/2020 gcc/9.3.0 blast+/2.14.0

blastn -db /cvmfs/bio.data.computecanada.ca/content/databases/Core/blast_dbs/2022_03_23/16S_ribosomal_RNA -query \
        ${1} -outfmt "6 qseqid stitle sallseqid pident evalue" -max_target_seqs 1 | sort -u > ${1::-4}_bl.txt
