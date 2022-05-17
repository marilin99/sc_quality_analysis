Channel.fromPath(params.in)
    .ifEmpty { error "Cannot find study file: ${params.in}" }
    .splitCsv(header: true, sep: '\t', strip: true)
    .map{row -> [ row.POOL_ID, row.SRA_ID, file(row.SRA_DIR) ]}
    .set { sra_ch }

process fastqdumpAll{
    
    input:
    set POOL_ID, SRA_ID, file(SRA_DIR) from sra_ch

    script:
    """
    /gpfs/space/home/ingvar/Bioinformatics/sratoolkit.2.9.6-centos_linux64/bin/fastq-dump.2.9.6 --split-files --gzip $SRA_DIR --outdir /gpfs/space/projects/genomic_references/OneK1K/fastq/${POOL_ID}_nf
    """
}
