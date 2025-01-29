load("main-workspace.RData")
library(tidyverse)
library(lemon)
library(ggforce)



#################################
#bar plots
table_for_plotting_mean <- clusters_table %>% 
  filter(mouse_genotype == "tif-mutant") %>% 
  filter(sample != "S5295Nr2") %>% 
  group_by(treatment, sample, cluster_resolution_0.8, gene_name) %>% 
  summarise(mean_cluster = mean(normalized_counts)) %>% 
  group_by(treatment, cluster_resolution_0.8, gene_name) %>%  
  summarise(mean_plot = mean(mean_cluster),
            sem = sd(mean_cluster)/(sqrt(length(mean_cluster)))) %>% 
  ungroup() %>% 
  mutate(mean_and_sem = mean_plot + sem)



#critical for right plotting of treatment!
table_for_plotting_mean$treatment <- factor(table_for_plotting_mean$treatment,
                                            levels = c("saline", "ldopa"))

for(i in unique(degs_list$gene)) {
  
  relevant_clusters <- degs_list %>% 
    filter(gene == i) %>% 
    mutate(cluster_no = str_remove(cluster, "cluster_")) %>% 
    select(cluster_no)
  
  table_for_plotting_mean_filtered <- table_for_plotting_mean %>% 
    filter(gene_name == i) %>% 
    filter(cluster_resolution_0.8 %in% as.vector(relevant_clusters$cluster_no)) %>% 
    group_by(gene_name) %>% 
    mutate(max_y_height = max(mean_and_sem)) %>% 
    mutate(y_max = case_when(max_y_height <= 1 ~ 1.5,
                             max_y_height > 1 & max_y_height <= 2 ~ 2.5,
                             max_y_height > 2 & max_y_height < 3 ~ 3,
                             max_y_height >= 3 & max_y_height <= 5 ~ 6,
                             max_y_height > 5 & max_y_height <= 6 ~ 8,
                             max_y_height > 6 & max_y_height <= 10 ~ 12,
                             max_y_height > 10 & max_y_height <= 15 ~ 17,
                             max_y_height > 15 ~ 20))
  
    ggplot(table_for_plotting_mean_filtered, aes(y = mean_plot, x = treatment, fill = treatment,
                  group = paste(cluster_resolution_0.8, treatment))) +
    geom_bar(color = "black", size = 0.3, position = position_dodge2(0.5), stat = "identity", width = 0.8) +
    geom_errorbar(aes(ymin = mean_plot-sem, ymax = mean_plot+sem),
                  width = 0.3, position = position_dodge(0.9), size = 0.3) +
    scale_fill_manual(values = c("#6792b8ff", "#054780ff"),
                      labels = c("saline", "L-DOPA")) +
    labs(y = "Mean expression\n",
         x = "Clusters",
         title = paste0(i,  ": quantile normalization")) +
    scale_y_continuous(limits = c(0, table_for_plotting_mean_filtered$y_max)) +
    coord_capped_cart(bottom='none', left="both") + 
    theme_classic() + 
    theme(
      panel.spacing = unit(0.01, "lines"),
      aspect.ratio = 12,
      title = element_text(size = 10,  face = "bold"),
      #text = element_text(family = "Calibri"),
      axis.title.y = element_text(face = "bold", size = 12),
      axis.title.x = element_text(face = "bold", size = 12),
      axis.line.x = element_line(colour = "white"),
      axis.line.y = element_line(size = 0.3, colour = "black"),
      axis.text.y = element_text(size = 10, colour = "black"),
      axis.text.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.ticks.length.y = unit(0.15, "cm"),
      axis.ticks.y = element_line(size = 0.1),
      strip.background = element_rect(fill = "#dfcbf5", colour = "white"),
      strip.text = element_text(size = 10),
      legend.position = "none",
      panel.border = element_blank(),
      axis.line = element_line()) +
    facet_row(~cluster_resolution_0.8, scales = "free_x", strip.position = "bottom", space = "free")
    
  ggsave(paste0("new-barplot-results-", i, ".pdf")) 
}

