#!/bin/bash

#SBATCH --partition=main
#SBATCH --time=1-0
#SBATCH --mem=15G
#SBATCH --cpus-per-task=4

source /gpfs/space/home/ingvar/BioENV/bin/activate

files_and_threadcount=$(python ./get_files_and_threadcount.py)
			
files="$(echo "$files_and_threadcount" | cut -d'~' -f1)"
thread_count="$(echo "$files_and_threadcount" | cut -d'~' -f2)"

echo $thread_count
echo $files

kb count -i index.idx -g t2g.txt -x 10xv2 -o ./kb_count_output_1pool -t $thread_count -m 10G --verbose --h5ad $files
