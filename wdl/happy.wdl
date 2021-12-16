version 1.0

task generateStratTable {
  input {
    Map [String, Boolean] myRegions
    File structToTrueLines
    String bucketPath
    String prefix
  }

  command <<<
    python ~{structToTrueLines} ~{write_json(myRegions)} ~{bucketPath} strattable > "~{prefix}_stratifications.tsv"
    python ~{structToTrueLines} ~{write_json(myRegions)} ~{bucketPath} lines > "~{prefix}_trueRegions.txt"
  >>>

  output {
    File stratTable = "~{prefix}_stratifications.tsv"
    Array[String] regionFiles = read_lines("~{prefix}_trueRegions.txt")
  }
  runtime {
    docker: "truwl/debian-buster"
    memory: "1 MB"
    cpu: 1
  }
}

task happyStratify {
  input {
    File queryVCF
    File truthVCF
    File highconfBed

    File referenceFasta
    File referenceFasta_indexed

    File stratTable
    Array[File?] regions
    String outputFile_commonPrefix
    String happyPrefix
    String consoleOutputPartialFilename
  }

  output {
    File annotated_vcf_gz = "~{outputFile_commonPrefix}~{happyPrefix}.vcf.gz"
    File annotated_vcf_gz_tbi = "~{outputFile_commonPrefix}~{happyPrefix}.vcf.gz.tbi"
    File runinfo_json = "~{outputFile_commonPrefix}~{happyPrefix}.runinfo.json"
    File roc_indel_pass = "~{outputFile_commonPrefix}~{happyPrefix}.roc.Locations.INDEL.PASS.csv.gz"
    File roc_indel = "~{outputFile_commonPrefix}~{happyPrefix}.roc.Locations.INDEL.csv.gz"
    File roc_snp_pass = "~{outputFile_commonPrefix}~{happyPrefix}.roc.Locations.SNP.PASS.csv.gz"
    File roc_snp = "~{outputFile_commonPrefix}~{happyPrefix}.roc.Locations.SNP.csv.gz"
    File roc_all = "~{outputFile_commonPrefix}~{happyPrefix}.roc.all.csv.gz"
    File extended_csv = "~{outputFile_commonPrefix}~{happyPrefix}.extended.csv"
    File metrics_json = "~{outputFile_commonPrefix}~{happyPrefix}.metrics.json.gz"
    File summary_csv = "~{outputFile_commonPrefix}~{happyPrefix}.summary.csv"
    File console_output_txt = "~{outputFile_commonPrefix}~{happyPrefix}~{consoleOutputPartialFilename}"
  }
  command <<<
    if [[ ~{referenceFasta} =~ \.gz$ ]]; then
    gunzip -c ~{referenceFasta} > ref.fa
    else
    mv ~{referenceFasta} ref.fa
    fi
    mv ~{referenceFasta_indexed} ref.fa.fai
    export HGREF=ref.fa
    /opt/hap.py/bin/hap.py --write-counts \
    -V ~{truthVCF} ~{queryVCF} \
    --false-positives ~{highconfBed} \
    --engine=vcfeval \
    --stratification ~{stratTable} \
    --threads 8 \
    -r ref.fa -o ~{outputFile_commonPrefix}~{happyPrefix} > ~{outputFile_commonPrefix}~{happyPrefix}~{consoleOutputPartialFilename}
  >>>
  runtime {
    docker: "paramost/hap.py"
    memory: "32 GB"
    cpu: 8
    disks: "local-disk 100 HDD"
  }
}
