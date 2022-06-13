#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH -N 4
#SBATCH --ntasks-per-node=8
#SBATCH --mem=100G
#SBATCH --job-name="fastq2h5ad"
#SBATCH --partition=amd

# Load needed system tools (Java 8 is required, one of singularity or anaconda - python 2.7 is needed,
# depending on the method for dependancy management). The exact names of tool modules might depend on HPC.
module load any/jdk/1.8.0_265
module load any/singularity/3.5.3
module load nextflow

source /gpfs/space/home/troosma/bioinformatics/bioinfenv/bin/activate


nextflow main.nf --in test.tsv -resume
