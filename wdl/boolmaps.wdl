version 1.0

#Twist is        33,167,129 bp
#high conf is 2,542,242,843 bp
#MHC is           4,970,557 bp
#difficult      628,689,391 bp
Map[String, Boolean] popRegions = {
  'region_GRCh38_alldifficultregions':true,
  'region_GRCh38_MHC':false,
  'region_twist_exome_target_hg38':false,
  'region_HG002_GIAB_highconfidence':false
}

Map[String, Boolean] fcRegions = {
  "region_GRCh38_notinrefseq_cds" : false,
  "region_GRCh38_refseq_cds" : false,
  "region_GRCh38_BadPromoters" : false,
}

Map[String, Boolean] gcRegions = {
  "region_GRCh38_gc15_slop50" : false,
  "region_GRCh38_gc15to20_slop50" : false,
  "region_GRCh38_gc20to25_slop50" : false,
  "region_GRCh38_gc25to30_slop50" : false,
  "region_GRCh38_gc30to55_slop50" : false,
  "region_GRCh38_gc55to60_slop50" : false,
  "region_GRCh38_gc60to65_slop50" : false,
  "region_GRCh38_gc65to70_slop50" : false,
  "region_GRCh38_gc70to75_slop50" : false,
  "region_GRCh38_gc75to80_slop50" : false,
  "region_GRCh38_gc80to85_slop50" : false,
  "region_GRCh38_gc85_slop50" : false,
  "region_GRCh38_gclt25orgt65_slop50" : false,
  "region_GRCh38_gclt30orgt55_slop50" : false,
}

Map[String, Boolean] gsRegionsSon = {
  "region_GRCh38_HG002_GIABv41_CNV_CCSandONT_elliptical_outlier" : false,
  "region_GRCh38_HG002_GIABv41_CNV_mrcanavarIllumina_CCShighcov_ONThighcov_intersection" : false,
  "region_GRCh38_HG002_expanded_150__Tier1plusTier2_v061" : false,
  "region_GRCh38_HG002_GIABv322_compoundhet_slop50" : false,
  "region_GRCh38_HG002_GIABv322_varswithin50bp" : false,
  "region_GRCh38_HG002_GIABv332_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv332_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv332_complexandSVs" : false,
  "region_GRCh38_HG002_GIABv332_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG002_GIABv332_complexindel10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv332_notin_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG002_GIABv332_snpswithin10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv41_CNVsandSVs" : false,
  "region_GRCh38_HG002_GIABv41_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv41_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv41_complexandSVs" : false,
  "region_GRCh38_HG002_GIABv41_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG002_GIABv41_complexindel10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv41_notin_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG002_GIABv41_othercomplexwithin10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv41_snpswithin10bp_slop50" : false,
  "region_GRCh38_HG002_GIABv41_CNV_gt2assemblycontigs_ONTCanu_ONTFlye_CCSCanu" : false,
  "region_GRCh38_HG002_GIABv41_inversions_slop25percent" : false,
  "region_GRCh38_HG002_Tier1plusTier2_v061" : false
}

Map[String, Boolean] gsRegionsDad = {
  "region_GRCh38_HG003_GIABv332_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG003_GIABv332_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG003_GIABv332_complexandSVs" : false,
  "region_GRCh38_HG003_GIABv332_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG003_GIABv332_complexindel10bp_slop50" : false,
  "region_GRCh38_HG003_GIABv332_notin_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG003_GIABv332_snpswithin10bp_slop50" : false
}
Map[String, Boolean] gsRegionsMom = {
  "region_GRCh38_HG004_GIABv332_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG004_GIABv332_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG004_GIABv332_complexandSVs" : false,
  "region_GRCh38_HG004_GIABv332_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG004_GIABv332_complexindel10bp_slop50" : false,
  "region_GRCh38_HG004_GIABv332_notin_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG004_GIABv332_snpswithin10bp_slop50" : false
}
Map[String, Boolean] gsRegionsOther = {
  "region_GRCh38_HG002_HG003_HG004_allsvs" : false,
  "region_GRCh38_HG001_GIABv322_compoundhet_slop50" : false,
  "region_GRCh38_HG001_GIABv322_varswithin50bp" : false,
  "region_GRCh38_HG001_GIABv332_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG001_GIABv332_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG001_GIABv332_complexandSVs" : false,
  "region_GRCh38_HG001_GIABv332_complexindel10bp_slop50" : false,
  "region_GRCh38_HG001_GIABv332_RTG_PG_v332_SVs_alldifficultregions" : false,
  "region_GRCh38_HG001_GIABv332_RTG_PG_v332_SVs_notin_alldifficultregions" : false,
  "region_GRCh38_HG001_GIABv332_snpswithin10bp_slop50" : false,
  "region_GRCh38_HG001_PacBio_MetaSV" : false,
  "region_GRCh38_HG001_PG2016_10_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG001_PG2016_10_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG001_PG2016_10_complexindel10bp_slop50" : false,
  "region_GRCh38_HG001_PG2016_10_snpswithin10bp_slop50" : false,
  "region_GRCh38_HG001_RTG_3773_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG001_RTG_3773_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG001_RTG_3773_complexindel10bp_slop50" : false,
  "region_GRCh38_HG001_RTG_3773_snpswithin10bp_slop50" : false,
  "region_GRCh38_HG005_GIABv332_comphetindel10bp_slop50" : false,
  "region_GRCh38_HG005_GIABv332_comphetsnp10bp_slop50" : false,
  "region_GRCh38_HG005_GIABv332_complexandSVs" : false,
  "region_GRCh38_HG005_GIABv332_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG005_GIABv332_complexindel10bp_slop50" : false,
  "region_GRCh38_HG005_GIABv332_notin_complexandSVs_alldifficultregions" : false,
  "region_GRCh38_HG005_GIABv332_snpswithin10bp_slop50" : false,
  "region_GRCh38_HG005_HG006_HG007_MetaSV_allsvs" : false
}

Map[String, Boolean] lcRegions = {
  "region_GRCh38_AllHomopolymers_gt6bp_imperfectgt10bp_slop5" : false,
  "region_GRCh38_AllTandemRepeats_201to10000bp_slop5" : false,
  "region_GRCh38_AllTandemRepeats_51to200bp_slop5" : false,
  "region_GRCh38_AllTandemRepeats_gt10000bp_slop5" : false,
  "region_GRCh38_AllTandemRepeats_gt100bp_slop5" : false,
  "region_GRCh38_AllTandemRepeats_lt51bp_slop5" : false,
  "region_GRCh38_AllTandemRepeatsandHomopolymers_slop5" : false,
  "region_GRCh38_notinAllHomopolymers_gt6bp_imperfectgt10bp_slop5" : false,
  "region_GRCh38_notinAllTandemRepeatsandHomopolymers_slop5" : false,
  "region_GRCh38_SimpleRepeat_diTR_11to50_slop5" : false,
  "region_GRCh38_SimpleRepeat_diTR_51to200_slop5" : false,
  "region_GRCh38_SimpleRepeat_diTR_gt200_slop5" : false,
  "region_GRCh38_SimpleRepeat_homopolymer_4to6_slop5" : false,
  "region_GRCh38_SimpleRepeat_homopolymer_7to11_slop5" : false,
  "region_GRCh38_SimpleRepeat_homopolymer_gt11_slop5" : false,
  "region_GRCh38_SimpleRepeat_imperfecthomopolgt10_slop5" : false,
  "region_GRCh38_SimpleRepeat_quadTR_20to50_slop5" : false,
  "region_GRCh38_SimpleRepeat_quadTR_51to200_slop5" : false,
  "region_GRCh38_SimpleRepeat_quadTR_gt200_slop5" : false,
  "region_GRCh38_SimpleRepeat_triTR_15to50_slop5" : false,
  "region_GRCh38_SimpleRepeat_triTR_51to200_slop5" : false,
  "region_GRCh38_SimpleRepeat_triTR_gt200_slop5" : false,
}

Map[String, Boolean] mpRegions = {
  "region_GRCh38_nonunique_l100_m2_e1" : false,
  "region_GRCh38_nonunique_l250_m0_e0" : false,
  "region_GRCh38_lowmappabilityall" : false,
  "region_GRCh38_notinlowmappabilityall" : false,
}

Map[String, Boolean] odRegions = {
  "region_GRCh38_allOtherDifficultregions" : false,
  "region_GRCh38_contigs_lt500kb" : false,
  "region_GRCh38_gaps_slop15kb" : false,
  "region_GRCh38_L1H_gt500" : false,
  "region_GRCh38_VDJ" : false,
}

Map[String, Boolean] sdRegions = {
  "region_GRCh38_chainSelf" : false,
  "region_GRCh38_chainSelf_gt10kb" : false,
  "region_GRCh38_gt5segdups_gt10kb_gt99percidentity" : false,
  "region_GRCh38_notinchainSelf" : false,
  "region_GRCh38_notinchainSelf_gt10kb" : false,
  "region_GRCh38_notinsegdups" : false,
  "region_GRCh38_notinsegdups_gt10kb" : false,
  "region_GRCh38_segdups" : false,
  "region_GRCh38_segdups_gt10kb" : false,
}

Map[String, Boolean] unRegions = {
  "region_GRCh38_alllowmapandsegdupregions" : false,
  "region_GRCh38_notinalldifficultregions" : false,
  "region_GRCh38_notinalllowmapandsegdupregions" : false,
}
