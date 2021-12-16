version 1.0

#import "boolmaps.wdl"

task extract_true {
  input {
  #FunctionalRegions fcRegions
  Map [String, Boolean] myRegions
  File structToTrueLines
  String bucketPath
  }
  command <<<
       python ~{structToTrueLines} ~{write_json(myRegions)} ~{bucketPath} lines > trueRegions.txt
   >>>
   runtime {
     docker: "truwl/debian-buster:latest"
     memory: "5 MB"
     cpu: 1
   }
   output {
     Array[String] matches = read_lines("trueRegions.txt")
   }
}

task test_intervene {
  input {
    String region
  }
  command <<<
    echo ~{region}
    >>>
  runtime {
    docker: "truwl/debian-buster:latest"
    memory: "5 MB"
    cpu: 1
  }
}


task run_intervene {
  input {
  
    #hardcoding this until we can get a system
    
    Boolean includeB1S5A
    Boolean includeWX8VK
    Boolean includeCZA1Y
    Boolean includeEIUT6
    Boolean includeXC97E
    Boolean includeXV7ZN
    Boolean includeIA789
    Boolean includeW607K
    String subject
    String freeze
    File queryVCF
    File region
  }
#
# gs://benchmarking-datasets/DRAGEN_HG002-NA24385-50x.vcf.gz
# gs://benchmarking-datasets/GATK_HG002-NA24385.Filtered.Variants.vcf.gz
# gs://benchmarking-datasets/GENALICE_HG002-NA24385.vcf.gz
# gs://benchmarking-datasets/GIAB-HG002-AJSon-CallsIn2Technologies.vcf.gz
# gs://benchmarking-datasets/GRCh37-lite.fa
# gs://benchmarking-datasets/GRCh37-lite.fa.fai
# gs://benchmarking-datasets/HG002-NA24385-pFDA.vcf.gz
# gs://benchmarking-datasets/HG002-multiall-fullcombine.vcf.gz
# gs://benchmarking-datasets/HG002-multiall-fullcombine.vcf.gz.tbi
# gs://benchmarking-datasets/HG002.fermikit.raw.vcf.gz
# gs://benchmarking-datasets/HG002_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-Solid-10X_CHROM1-22_v3.3_highconf.bed
# gs://benchmarking-datasets/HG002_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-Solid-10X_CHROM1-22_v3.3_highconf.vcf.gz
# gs://benchmarking-datasets/HG002run1_S1.genome.vcf
# gs://benchmarking-datasets/HG002run1_S1.genome.vcf.gz
# gs://benchmarking-datasets/ISAAC_HG002-NA24385_all_passed_variants.vcf.gz
# gs://benchmarking-datasets/LabCorp.fixed.vcf.gz
# gs://benchmarking-datasets/LabCorp.newheader.vcf.gz
# gs://benchmarking-datasets/LabCorp.reheader.vcf.gz
# gs://benchmarking-datasets/LabCorp_HG002.vcf.gz
# gs://benchmarking-datasets/NA12878_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-Solid-10X_CHROM1-X_v3.3_highconf.bed
# gs://benchmarking-datasets/SIB-HG002.vcf.gz
# gs://benchmarking-datasets/SIB-MT.vcf.gz
# gs://benchmarking-datasets/Sentieon.fixed.vcf
# gs://benchmarking-datasets/Truth.highconf.CodingExons.vcf.gz
# gs://benchmarking-datasets/Truth.highconf.WholeExome.vcf.gz
# gs://benchmarking-datasets/VQSR_HG002-NA24385.recalibrated_variants.vcf.gz
# gs://benchmarking-datasets/aggregateResults.R
# gs://benchmarking-datasets/codingexons.bed
# gs://benchmarking-datasets/codingexons.nochr.bed
# gs://benchmarking-datasets/competitors.csv
# gs://benchmarking-datasets/indelSizeDistribution_Detailed.R
# gs://benchmarking-datasets/precRecallPlot.R
# gs://benchmarking-datasets/simple_notebook.ipynb

  String dollar = "$"
  command <<<
    declare -a downloadList=()
    optvcfs=""
    if [ "~{freeze}" = "hg38" ]; then
        if ~{includeB1S5A}; then
         optvcfs="${optvcfs} B1S5A_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/B1S5A/B1S5A_~{subject}.vcf.gz")
        fi
        if ~{includeWX8VK}; then
         optvcfs="${optvcfs} WX8VK_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/WX8VK/WX8VK_~{subject}.vcf.gz")
        fi
        if ~{includeCZA1Y}; then
         optvcfs="${optvcfs} CZA1Y_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/CZA1Y/CZA1Y_~{subject}.vcf.gz")
        fi
        if ~{includeEIUT6}; then
         optvcfs="${optvcfs} EIUT6_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/EIUT6/EIUT6_~{subject}.vcf.gz")
        fi
        if ~{includeXC97E}; then
         optvcfs="${optvcfs} XC97E_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/XC97E/XC97E_~{subject}.vcf.gz")
        fi
        if ~{includeXV7ZN}; then
         optvcfs="${optvcfs} XV7ZN_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/XV7ZN/XV7ZN_~{subject}.vcf.gz")
        fi
        if ~{includeIA789}; then
         optvcfs="${optvcfs} IA789_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/IA789/IA789_~{subject}.vcf.gz")
        fi
        if ~{includeW607K}; then
         optvcfs="${optvcfs} W607K_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/W607K/W607K_~{subject}.vcf.gz")
        fi
    fi
    
    if [ "~{freeze}" = "hg37" ]; then
        if ~{includeB1S5A}; then
         optvcfs="${optvcfs} B1S5A_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/B1S5A/B1S5A_~{subject}.vcf.gz")
        fi
        if ~{includeWX8VK}; then
         optvcfs="${optvcfs} WX8VK_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/WX8VK/WX8VK_~{subject}.vcf.gz")
        fi
        if ~{includeCZA1Y}; then
         optvcfs="${optvcfs} CZA1Y_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/CZA1Y/CZA1Y_~{subject}.vcf.gz")
        fi
        if ~{includeEIUT6}; then
         optvcfs="${optvcfs} EIUT6_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/EIUT6/EIUT6_~{subject}.vcf.gz")
        fi
        if ~{includeXC97E}; then
         optvcfs="${optvcfs} XC97E_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/XC97E/XC97E_~{subject}.vcf.gz")
        fi
        if ~{includeXV7ZN}; then
         optvcfs="${optvcfs} XV7ZN_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/XV7ZN/XV7ZN_~{subject}.vcf.gz")
        fi
        if ~{includeIA789}; then
         optvcfs="${optvcfs} IA789_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/IA789/IA789_~{subject}.vcf.gz")
        fi
        if ~{includeW607K}; then
         optvcfs="${optvcfs} W607K_~{subject}.vcf.gz"
         downloadList+=("gs://truwl-giab/submission_vcfs/hg19/W607K/W607K_~{subject}.vcf.gz")
        fi
    fi

    mkdir fullVCF
    for competitor in "~{dollar}{downloadList[@]}"
    do
         echo ~{dollar}competitor
         gsutil cp ~{dollar}competitor fullVCF/
         echo "cmd: bedtools intersect -a fullVCF/~{dollar}(basename "~{dollar}competitor") -b ~{region} -wa -header | gzip -c > tmpintersect.vcf.gz"
         bedtools intersect -a "fullVCF/"~{dollar}(basename "~{dollar}competitor") -b ~{region} -wa -header | gzip -c > tmpintersect.vcf.gz
         mv tmpintersect.vcf.gz `basename "~{dollar}competitor"`
    done
    
    queryVCFname=~{dollar}(basename "~{queryVCF}")
    bedtools intersect -a ~{queryVCF} -b ~{region} -wa -header | gzip -c > "region"~{dollar}queryVCFname
    
    regionName=~{dollar}(basename "~{region}")
    mkdir -p Intervene_results
    mkdir -p Intervene_results/sets
    #-–mblabel 'Intersections in '~{dollar}regionName -–sxlabel 'Set size in '~{dollar}regionName
    intervene upset  --figtype png --type genomic -i "region"~{dollar}queryVCFname ~{dollar}optvcfs --save-overlaps --filenames --bedtools-options header
  >>>
  
  runtime {
    docker: "truwl/intervene"
    memory: "8 GB"
    cpu: 2
    disks: "local-disk 200 HDD"
  }
  output {
    File upsetplot = "Intervene_results/Intervene_upset.png"
  }
}
