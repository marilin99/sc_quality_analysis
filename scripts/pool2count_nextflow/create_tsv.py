import os
import csv


path_to_fastq = "/gpfs/space/projects/genomic_references/OneK1K/fastq"

list_of_lists = []
list_of_fastq = []

#_ctn = 0
for dirpath, _, filenames in os.walk(path_to_fastq):
    list_of_fastq = []
    for filename in sorted(filenames):
        if filename.endswith("_3.fastq.gz") or filename.endswith("_2.fastq.gz"):
            list_of_fastq.append(os.path.join(dirpath, filename))
#    print(list_of_fastq)
#    print('--------')
#    _ctn += 1
#    if _ctn == 2:
#        break
    list_of_lists.append(" ".join(list_of_fastq))

#print(list_of_lists)
with open("test.tsv", 'w', encoding = 'utf-8') as f:
    f.write('fastq_files')
    for line in list_of_lists:
        f.write(line)
        f.write('\n')
#fastq_files = " ".join(list_of_fastq)
