#!/bin/bash

#SBATCH --time=00:15:00       # The duration in HH:MM:SS format of each task in the array
#SBATCH --cpus-per-task=1     # The number of cores for each task in the array
#SBATCH --mem-per-cpu=100GB    # The memory per core for each task in the array
#SBATCH --output=blast_1.%J.out
#SBATCH --error=blast_1.%J.err


module load StdEnv/2020 gcc/9.3.0 blast+/2.14.0

# Using the index of the current task, given by `$SLURM_ARRAY_TASK_ID`, run the corresponding query and write the result
for file in `ls ${1}/*.fna`;
do 
        blastn -db /cvmfs/bio.data.computecanada.ca/content/databases/Core/blast_dbs/2022_03_23/16S_ribosomal_RNA -query ${file} -outfmt 0 -num_descriptions 10 -num_alignments 10 -out ${file::-4}_bl.txt;
done
