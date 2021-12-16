version 1.0

## Generating the Indel distribution for WholeExome using bcftools, USE TRUTH VCF ! (not Happy's annotated VCF)

task indelDistribution_CodingExons_HappyResults {
  input {
    String outputFile_commonPrefix
    String codingExonsPrefix
    File truthCodingExonsVCF
    String indelDistributionSuffix
  }
  output {
    File indelDistribution_CodingExons = "~{outputFile_commonPrefix}~{codingExonsPrefix}~{indelDistributionSuffix}"
  }
  command <<<
    start=`bcftools stats ~{truthCodingExonsVCF}| awk '/InDel distribution/ {{print FNR}}'`;
    end=`bcftools stats ~{truthCodingExonsVCF}| awk '/Substitution types/ {{print FNR}}'`;
    end=$((end - 1)); bcftools stats ~{truthCodingExonsVCF}| sed -n "$start,$end p" > ~{outputFile_commonPrefix}~{codingExonsPrefix}~{indelDistributionSuffix}
  >>>

  runtime {
    docker: "vandhanak/bcftools:1.3.1"
    memory: "8 GB"
    cpu: 8
  }
}

task indelDistribution_WholeExome_HappyResults {
  input {
    String outputFile_commonPrefix
    String WholeExomePrefix
    File truthWholeExomeVCF
    String indelDistributionSuffix
  }
  output {
    File indelDistribution_WholeExome = "~{outputFile_commonPrefix}~{WholeExomePrefix}~{indelDistributionSuffix}"
  }
  command <<<
    start=`bcftools stats ~{truthWholeExomeVCF}| awk '/InDel distribution/ {{print FNR}}'`;
    end=`bcftools stats ~{truthWholeExomeVCF}| awk '/Substitution types/ {{print FNR}}'`;
    end=$((end - 1)); bcftools stats ~{truthWholeExomeVCF}| sed -n "$start,$end p" > ~{outputFile_commonPrefix}~{WholeExomePrefix}~{indelDistributionSuffix}
  >>>

  runtime {
    docker: "vandhanak/bcftools:1.3.1"
    memory: "8 GB"
    cpu: 8
  }
}

## Generating the Indel distribution for Coding Exons based on size ranges + TP,FP,FN counts for each size range

task indelSizeDistribution_CodingExons_HappyResults {
  input {
    String outputFile_commonPrefix
    String codingExonsPrefix
    File indelDistribution_CodingExons
    String indelSizeDistributionSuffix
    String indelSizeDistributionPlotSuffix
    File codingExons_annotated_TPonly_vcf_gz
    File codingExons_annotated_FPonly_vcf_gz
    File codingExons_annotated_FNonly_vcf_gz
    File Rscript_indelSize
  }
  output {
    File indelSizeDistribution_CodingExons = "~{outputFile_commonPrefix}~{codingExonsPrefix}~{indelSizeDistributionSuffix}"
    File indelSizeDistributionPlot_CodingExons = "~{outputFile_commonPrefix}~{codingExonsPrefix}~{indelSizeDistributionPlotSuffix}"
  }
  command <<<
    Rscript ~{Rscript_indelSize} ~{indelDistribution_CodingExons} ~{codingExons_annotated_TPonly_vcf_gz} ~{codingExons_annotated_FPonly_vcf_gz} ~{codingExons_annotated_FNonly_vcf_gz} ~{outputFile_commonPrefix}~{codingExonsPrefix}~{indelSizeDistributionSuffix} ~{outputFile_commonPrefix}~{codingExonsPrefix}~{indelSizeDistributionPlotSuffix}
  >>>
  runtime {
    docker: "vandhanak/rbase:3.3.2"
    memory: "8 GB"
    cpu: 1
  }
}
## Generating the Indel distribution for WholeExome based on size ranges + TP,FP,FN counts for each size range

task indelSizeDistribution_WholeExome_HappyResults {
  input {
    String outputFile_commonPrefix
    String WholeExomePrefix
    File indelDistribution_WholeExome
    String indelSizeDistributionSuffix
    String indelSizeDistributionPlotSuffix
    File WholeExome_annotated_TPonly_vcf_gz
    File WholeExome_annotated_FPonly_vcf_gz
    File WholeExome_annotated_FNonly_vcf_gz
    File Rscript_indelSize
  }
  output {
    File indelSizeDistribution_WholeExome = "~{outputFile_commonPrefix}~{WholeExomePrefix}~{indelSizeDistributionSuffix}"
    File indelSizeDistributionPlot_WholeExome = "~{outputFile_commonPrefix}~{WholeExomePrefix}~{indelSizeDistributionPlotSuffix}"
  }
  command <<<
    Rscript ~{Rscript_indelSize} ~{indelDistribution_WholeExome} ~{WholeExome_annotated_TPonly_vcf_gz} ~{WholeExome_annotated_FPonly_vcf_gz} ~{WholeExome_annotated_FNonly_vcf_gz} ~{outputFile_commonPrefix}~{WholeExomePrefix}~{indelSizeDistributionSuffix} ~{outputFile_commonPrefix}~{WholeExomePrefix}~{indelSizeDistributionPlotSuffix}
  >>>
  runtime {
    docker: "vandhanak/rbase:3.3.2"
    memory: "8 GB"
    cpu: 1
  }
}