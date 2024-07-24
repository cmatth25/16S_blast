#!/bin/bash
#Compute_Canada

#SBATCH --time=00:15:00       # The duration in HH:MM:SS format of each task in the array
#SBATCH --cpus-per-task=1     # The number of cores for each task in the array
#SBATCH --mem-per-cpu=100GB    # The memory per core for each task in the array

module load StdEnv/2020 gcc/9.3.0 blast+/2.14.0

blastn -db /cvmfs/bio.data.computecanada.ca/content/databases/Core/blast_dbs/2022_03_23/16S_ribosomal_RNA -query \
        ${1} -outfmt "6 qseqid stitle" -max_target_seqs 1 | sort -u > ${1}.refb

join -t '       ' -a 2 -1 1 -2 1 <( cat ${1}.refb | sort -t '   '  -k1,1 )  <(cat ${1} | paste - - | cut -c2- | sort -t '       ' -k1,1)\
         | awk -F '     ' '{printf(">%s",$1);i=2;if(NF==3) {printf(" %s",$2);i++;} printf("\n%s\n",$i);}' > ${1::-4}_ID.fna
