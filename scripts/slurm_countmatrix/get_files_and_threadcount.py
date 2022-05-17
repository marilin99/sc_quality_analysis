import os
import threading

one_pool_dir = "/gpfs/space/projects/genomic_references/OneK1K/fastq/SAMN25948860"

list_of_fastq = []
for dirpath, _, filenames in os.walk(one_pool_dir):
    for filename in sorted(filenames):
        if filename.endswith("_3.fastq.gz") or filename.endswith("_2.fastq.gz"):
            list_of_fastq.append(os.path.join(dirpath, filename))
fastq_files = " ".join(list_of_fastq)

print(f"{fastq_files}~{threading.active_count()}", end='')