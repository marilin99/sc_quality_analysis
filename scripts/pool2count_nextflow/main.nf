Channel.fromPath(params.in)
    .ifEmpty { error "Cannot find study file: ${params.in}" }
    .splitCsv(header: true, sep: '\t', strip: true)
    .map{row -> [ row.fastq_files ]}
    .set { sra_ch }

process createCountMatrices{
    cpus 2
    memory '5 GB'
    
    input:
    set fastq_files from sra_ch

    script:
    """
    /gpfs/space/home/troosma/bioinformatics/bioinfenv/bin/kb count -i /gpfs/space/home/troosma/bioinformatics/project/sc_quality_analysis/scripts/pool2count_nextflow/index.idx -g /gpfs/space/home/troosma/bioinformatics/project/sc_quality_analysis/scripts/pool2count_nextflow/t2g.txt -x 10xv2 -o ./kb_count_output -t ${task.cpus} -m 5G --verbose --h5ad $fastq_files
    """
}
