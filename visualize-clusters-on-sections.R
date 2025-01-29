load("main-workspace.RData")


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

ldopa_integrate_clusters <- FindClusters(ldopa_integrate, resolution = 0.8)



#umap 

UMAPPlot(ldopa_integrate_clusters, cols = newest_palette, pt.size = 0.2)
ggsave(file = "umap-newest-correct.pdf", dpi = 300, width = 30, height = 20, units = "cm")

######
spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr1",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr1-clusters.pdf"), width = 21.6, height = 21.23, units = "cm", dpi = 300)


spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr2",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr2-clusters.pdf"), width = 21.1, height = 22.7, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr3",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr3-clusters.pdf"), width = 22.3, height = 22.2, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr5",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr5-clusters.pdf"), width = 24, height = 23, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr6",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr6-clusters.pdf"), width = 23.9, height = 22.8, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr7",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr7-clusters.pdf"), width = 21.5, height = 22.9, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr8",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr8-clusters.pdf"), width = 22.2, height = 24.5, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5023Nr1",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5023Nr1-clusters.pdf"), width = 20.4, height = 20, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5023Nr4",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5023Nr4-clusters.pdf"), width = 20, height = 19.9, units = "cm", dpi = 300)

spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5295Nr4",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5295Nr4-clusters.pdf"), width = 20.55, height = 22, units = "cm", dpi = 300)


spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5023Nr3",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5023Nr3-clusters.pdf"), width = 20, height = 20.15, units = "cm", dpi = 300)


spatial_cluster(spatial_data = ldopa_st_data_reduced,
                resolution = 0.8,
                samples = "S5023Nr2",
                palette = newest_palette,
                size = 2.2,
                ncol = 1)

ggsave(filename = paste0( "S5023Nr2-clusters.pdf"), width = 20, height = 20.15, units = "cm", dpi = 300)
