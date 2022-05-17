#!/bin/bash

#SBATCH --time=24:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=5G
#SBATCH --job-name="sra2fastq"
#SBATCH --partition=amd

# Load needed system tools (Java 8 is required, one of singularity or anaconda - python 2.7 is needed,
# depending on the method for dependancy management). The exact names of tool modules might depend on HPC.
module load any/jdk/1.8.0_265
module load any/singularity/3.5.3
module load nextflow

nextflow main.nf --in sra.tsv
