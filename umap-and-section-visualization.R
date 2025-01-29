source("preprocessing/functions/functions-spatial-data.R")
source("preprocessing/functions/visualization-functions.R")
load("ldopa-reduced-correct.RData")

library(Seurat)

#define color palette
newest_palette <- c('0' = "#ed2b2b",
                 '1' = "#c2f702",
                 '2' = "#f0dd30",
                 '3' = "#911432",
                 '4' = "#a0bd11",
                 '5' = "#54630c",
                 '6' = "#4e57ba",
                 '7' = "#0a0a0a",
                 '8' = "#bd721c",
                 '9' = "#7ff59f",
                 '10' = "#b64ef2",
                 '11' = "#f57878",
                 '12' = "#2059d4",
                 '13' = "#0f20d9",
                 '14' = "#578a65",
                 '15' = "#e0c8d2",
                 '16' = "#8bc1f0",
                 '17' = "#f5a556",
                 '18' = "#f77d05",
                 '19' = "#24b0bf",
                 '20' = "#5c95e6",
                 '21' = "#f711dd",
                 '22' = "#8721c2",
                 '23' = "#2cdb12",
                 '24' = "#8a8987",
                 '25' = "#ffeeaa",
                 '26' = "#ff0065")


#perform unsupervised cluster analysis with Seurat
ldopa_integrate_clusters <- FindClusters(ldopa_integrate, resolution = 0.8)



#other options
umap <- UMAPPlot(ldopa_integrate_clusters, cols = newest_palette, pt.size = 0.2)
LabelClusters(umap, id = 'ident', repel = TRUE, box.padding = 1) 

#UMAPs by groups
#add group variable to clusters
ldopa_integrate_clusters$group <- NA
ldopa_integrate_clusters$group[ldopa_integrate_clusters$sample %in% c("S5023Nr1",  "S5023Nr4", "S5295Nr1",  "S5295Nr6",  "S5295Nr7")] <- "mutant saline"
ldopa_integrate_clusters$group[ldopa_integrate_clusters$sample %in% c("S5023Nr2", "S5023Nr3",  "S5295Nr3",  "S5295Nr8")] <- "mutant L-DOPA"
ldopa_integrate_clusters$group[ldopa_integrate_clusters$sample %in% c("S5295Nr4", "S5295Nr5")] <- "control saline"
ldopa_integrate_clusters$group[ldopa_integrate_clusters$sample== "S5295Nr2"] <- "false mutant L-DOPA"

mycol <- rgb(0, 0, 255, max = 255, alpha = 0, names = "transparent")

#some of the options to create UMAPs by groups
UMAPPlot(ldopa_integrate_clusters, pt.size = 0.57, group.by = "group") +
  scale_color_manual(values = c("#0000FF00", "#0000FF00","#054780ff", "#0000FF00"))
ggsave(file = "umap-by-groups-mutanty-ldopa-transparent.pdf", dpi = 300, width = 30, height = 20, units = "cm")

UMAPPlot(ldopa_integrate_clusters, pt.size = 0.57, group.by = "group") +
scale_color_manual(values = c("#0000FF00", "#0000FF00","#0000FF00", '#1f7fd1ff'))
ggsave(file = "umap-by-groups-mutanty-saline-transparent.pdf", dpi = 300, width = 30, height = 20, units = "cm")

UMAPPlot(ldopa_integrate_clusters, pt.size = 0.57, group.by = "group") +
  scale_color_manual(values = c("#0000FF00", "red","#0000FF00", "#0000FF00"))

UMAPPlot(ldopa_integrate_clusters, pt.size = 0.57, group.by = "group") +
  scale_color_manual(values = c("green", "#0000FF00","#0000FF00", "#0000FF00"))


#visualize clusters and gene expression on samples 
spatial_interest_cluster(cluster = 2,
                         # seurat_object = integrated_analysis,
                         spatial_data = ldopa_st_data_reduced,
                         resolution = 1,
                         samples = "S5023Nr3",
                         size= 1,
                         ncol = 4)

spatial_gene_plot(spatial_data = ldopa_st_data_reduced,
                  type_data = "quantile_normalize_resolution_0.8",
                  gene = "Sgk1",
                  samples =  "S5023Nr3",
                  min_percentile = 0.00,
                  max_percentile = 1,
                  size = 1.4,
                  ncol = 4,
                  tif_image = F,
                  normalization = T)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 1,
                samples = c(samples_saline, samples_ldopa),
                palette = palette_allen,
                size= 1.0,
                ncol = 4)



