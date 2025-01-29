load("main-workspace.RData")

library(Seurat)

#identify genes by peaks
peaks2genes <- ldopa_st_data_reduced$quantile_normalize_resolution_0.8$annotate %>% 
  select(peak_id, gene_name, gene_id) 


###markers###
cluster_markers <- FindAllMarkers(ldopa_integrate_clusters, min.pct = 0.4, only.pos = TRUE, logfc.threshold = 0.8)
cluster_markers$peak_id <- cluster_markers$gene
cluster_markers <- cluster_markers %>% 
  select(-gene) %>% 
  left_join(peaks2genes)

