load("main-workspace.RData")
library(Seurat)
library(tidyverse)
library(magrittr)
library(writexl)
library(vctrs)


#how many spots in each cluster
table(ldopa_integrate_clusters$integrated_snn_res.0.8)

#how many peaks and genes in the dataset
all_peaks <- ldopa_st_data_reduced[["quantile_normalize_resolution_0.8"]][["annotate"]]

length(unique(all_peaks$peak_id)) #15,955
length(unique(all_peaks$gene_name)) #10,545
length(unique(all_peaks$gene_id)) #10,545


clusters_info <- ldopa_st_data_reduced[["clusters"]] %>% as.data.frame(.) %>% select(c(sample, barcode, mouse_genotype, treatment, cluster_resolution_0.8))

#which cluster is present in each sample and how many spots
table(clusters_info$sample, clusters_info$cluster_resolution_0.8)

#####

clusters_info <- ldopa_st_data_reduced[["clusters"]] %>% as.data.frame(.) %>% select(c(sample, barcode, mouse_genotype, treatment, cluster_resolution_0.8))
peaks2genes <- ldopa_st_data_reduced[["quantile_normalize_resolution_0.8"]][["annotate"]] %>% 
  as.data.frame(.) %>% select(peak_id, gene_name, gene_id)







