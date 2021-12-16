version 1.0

task melt {
  input {
    String job_id
    String workflow_instance_identifier
    String workflow_identifier
    File codingExons_summary_csv
    File WholeExome_summary_csv
    File Rscript_aggregate
  }
  output {
    File talltable = "truwlbenchmarks.txt"
  }
  command <<<
    Rscript ~{Rscript_aggregate} ~{job_id} ~{workflow_instance_identifier} ~{workflow_identifier} ~{WholeExome_summary_csv} ~{codingExons_summary_csv} truwlbenchmarks.txt
  >>>
  runtime {
    docker: "rocker/tidyverse:4.1.0"
    memory: "1 GB"
    cpu: 1
  }
}