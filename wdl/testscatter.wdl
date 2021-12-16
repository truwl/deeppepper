version 1.0

import "compoundbools.wdl" as compoundbools
import "intervene.wdl" as intervene


workflow testScatter {

  input {
    FunctionalRegions fcRegions = {
      'region_GRCh38_notinrefseq_cds':false,
      'region_GRCh38_refseq_cds':true,
      'region_GRCh38_BadPromoters':false
    }
    File structToTrueLines =  "https://raw.githubusercontent.com/truwl/variantbenchmarking/stratify/wdl/structToTrueLines.py"
    String bucketPath = "gs://truwl-giab/genome-stratifications/v2.0/GRCh38/FunctionalRegions/"
    }
    Array[String] regions = ['region_GRCh38_notinrefseq_cds','region_GRCh38_refseq_cds','region_GRCh38_BadPromoters']
    Array[String] trueRegions = select_all([fcRegions.region_GRCh38_notinrefseq_cds,fcRegions.region_GRCh38_refseq_cds,fcRegions.region_GRCh38_BadPromoters])

  call intervene.extract_true as extractme {
      input:
          fcRegions = fcRegions,
          structToTrueLines = structToTrueLines,
          bucketPath = bucketPath
  }
  scatter (region in trueRegions) {
      call intervene.test_intervene as myintervene {
          input:
              region = region
      }
  }
}