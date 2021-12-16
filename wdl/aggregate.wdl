version 1.0

task melt {
  input {
    String job_id
    String workflow_instance_identifier
    String workflow_identifier
    File extended_csv
    File Rscript_aggregate
  }
  output {
    File talltable = "truwlbenchmarks.txt"
  }
  command <<<
    Rscript ~{Rscript_aggregate} ~{job_id} ~{workflow_instance_identifier} ~{workflow_identifier} ~{extended_csv} allmetrics.txt
    #filter out non-numeric output
    cat allmetrics.txt | perl -ne '(m/[0-9]$/ || m/^Type/) && print' >> truwlbenchmarks.txt
  >>>
  runtime {
    docker: "rocker/tidyverse:4.1.0"
    memory: "1 GB"
    cpu: 1
  }
}

task precRecall {
  input {
    File Rscript_precrecall
    File staticcompetitors
    File truwlbenchmarks
    String samplename
    String outputplotname
  }
  output {
    File precrecallplot = "~{outputplotname}"
  }
  command <<<
    Rscript ~{Rscript_precrecall} ~{samplename} ~{truwlbenchmarks} ~{staticcompetitors} ~{outputplotname}
  >>>
  runtime {
    docker: "truwl/precrecall:latest"
    memory: "1 GB"
    cpu: 1
  }
}

task aggStrat {
  input {
    Array[File] stratTables
  }
  output {
    File strattable = "stratifications.tsv"
  }
  command <<<
    cat ~{sep=' ' stratTables} > "stratifications.tsv"
  >>>
  runtime {
    docker: "rocker/tidyverse:4.1.0"
    memory: "1 GB"
    cpu: 1
  }
}

task aggFiles {
  input {
    Array[Array[String]] regionFilesArrays
  }
  output {
    Array[String] regionFiles = flatten(regionFilesArrays)
  }
  command <<<
  >>>
  runtime {
    docker: "truwl/debian-buster"
    memory: "1 MB"
    cpu: 1
  }
}

# remove empty lines otherwise Cromwell will try to fetch them as files

task nonEmpty {
  input {
    Array[String] emptyLines
  }
  output {
    Array[String] noEmptyLines = read_lines(stdout())
  }
  command <<<
    perl -ne 'print unless (/^\s*\n/)' < ~{write_lines(emptyLines)}
  >>>
  runtime {
    docker: "truwl/debian-buster"
    memory: "1 MB"
    cpu: 1
  }
}

task finalReport {
  input {
    File queryVCF
    String freeze
    String subject
    String outputFile_commonPrefix
    String happyPrefix
    Array[File] upset_plots
    File prec_recall_plot
    File jupyter_notebook
  }
  output {
    File annoreport = "finalReport.ipynb"
    File annohtml = "finalReport.html"
  }
  runtime {
    docker: "truwl/happyrpapermill"
    memory: "1 GB"
    cpu: 1
  }
  command <<<
    mkdir -p /home/jovyan/.cache/black/21.7b0/
    papermill ~{jupyter_notebook} -p queryVCF ~{queryVCF} -p freeze ~{freeze} -p subject ~{subject} -p upset_plot ~{sep=',' upset_plots} -p prec_recall_plot ~{prec_recall_plot} finalReport.ipynb
    jupyter nbconvert finalReport.ipynb --to html --output finalReport.html
  >>>
}
