load("main-workspace.RData")
library(tidyverse)

for(i in unique(degs_list$peak)){
  print(i)
  i_peak <- degs_list %>% filter(peak == i)
  i_genefrompeak <- i_peak$gene
  
  spatial_gene_plot(spatial_data = ldopa_st_data_reduced,
                    type_data = "quantile_normalize_resolution_0.8",
                    gene = i_genefrompeak, 
                    samples =  "S5023Nr3",
                    min_percentile = 0.00,
                    max_percentile = 1,
                    size = 2.2,
                    ncol = 1,
                    tif_image = F,
                    normalization = T)
  
  ggsave(paste0("S5023Nr3-ldopa-", i_genefrompeak, ".pdf"), width = 22, height = 20.7, units = "cm", dpi = 300)
  
  spatial_gene_plot(spatial_data = ldopa_st_data_reduced,
                    type_data = "quantile_normalize_resolution_0.8",
                    gene = i_genefrompeak, 
                    samples =  "S5295Nr1",
                    min_percentile = 0.00,
                    max_percentile = 1,
                    size = 2.2,
                    ncol = 1,
                    tif_image = F,
                    normalization = T)
  
  ggsave(paste0("S5295Nr1-saline-", i_genefrompeak, ".pdf"), width = 23.3, height = 21.45, units = "cm", dpi = 300)
  
}

