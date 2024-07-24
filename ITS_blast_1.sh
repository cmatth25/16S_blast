#!/bin/bash

#SBATCH --time=00:15:00       
#SBATCH --cpus-per-task=1     
#SBATCH --mem-per-cpu=100GB    
#SBATCH --output=blast_1.%J.out
#SBATCH --error=blast_1.%J.err


module load StdEnv/2020 gcc/9.3.0 blast+/2.14.0

# Using the index of the current task, given by `$SLURM_ARRAY_TASK_ID`, run the corresponding query and write the result
for file in `ls ${1}/*.fna`;
do 
        blastn -db /cvmfs/bio.data.computecanada.ca/content/databases/Core/blast_dbs/2022_03_23/ITS_RefSeq_Fungi -query ${file} -outfmt 0 -num_descriptions 10 -num_alignments 10 -out ${file::-4}_bl.txt;
done
