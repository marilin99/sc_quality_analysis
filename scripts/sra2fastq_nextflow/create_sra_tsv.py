import os
import pandas as pd
import csv

path_to_sra = "/gpfs/space/projects/genomic_references/OneK1K/sra"
metadata = pd.read_csv("/gpfs/space/home/ingvar/Bioinformatics/OneK1K_SRR_metadata.txt", sep = "\t")

for root, dirs, files in os.walk(path_to_sra):
	with open('sra.tsv', 'w', newline="", encoding="utf-8") as tsvfile:
		writer = csv.writer(tsvfile, delimiter='\t')
		writer.writerow(["POOL_ID","SRA_ID", "SRA_DIR"])
		for file in sorted(files):
			filename_without_filetype = file[:-4]
			accession = metadata[metadata["run_accession"] == filename_without_filetype]["accession"].values[0]
			writer.writerow([accession, filename_without_filetype, os.path.join(root, file)])

