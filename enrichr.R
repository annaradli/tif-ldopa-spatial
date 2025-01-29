library(enrichR)
library(tidyverse)
library(writexl)
library(vctrs)

degs_list <- read.table("results.tsv", header = T)
nrow(degs_list) #181 records
length(unique(degs_list$gene)) #121 unique genes
length(unique(degs_list$peak)) #121 unique peaks
length(unique(degs_list$cluster)) #23 clusters
unique(degs_list$cluster) #no results for clusters #: 2, 10, 19, 26

all_enrichr <- listEnrichrDbs()
all_enrichr %>% select(libraryName) %>%  View(.)

#choose databases of interest
dbs2analyze <- c(
                 "Disease_Perturbations_from_GEO_down",
                 "Disease_Perturbations_from_GEO_up",
                 "DisGeNET",
                 "GO_Biological_Process_2023",
                 "GO_Cellular_Component_2023",
                 "GO_Molecular_Function_2023",
                 "Human_Phenotype_Ontology",
                 "OMIM_Disease",
                 "OMIM_Expanded")

websiteLive <- getOption("enrichR.live")

if(websiteLive) {
  enriched <- enrichr(degs_list$gene, dbs2analyze)
}

# for (i in enriched) {
#   filter_i <- i %>% filter(Adjusted.P.value < 0.05)
#   write_xlsx(filter_i, paste(filter_i, "adj-p-all.xlsx"))
# }

#less databases to analyze in batch by enrichR does not alternate adjusted p-value
write_xlsx(enriched, "all-enriched-fewer.xlsx")

enriched_list <- purrr::list_rbind(enriched, names_to='db_name')
enriched_list <- enriched_list %>% filter((Adjusted.P.value < 0.05))


#visualization
if (websiteLive) enriched[["GO_Biological_Process_2023"]] 
if (websiteLive) {
  plotEnrich(enriched[[13]]%>% filter(Adjusted.P.value < 0.05), 
             title = "GO_Biological_Process_2023", 
             showTerms = 30, numChar = 60, y = "Count", orderBy = "Overlap")
}

if (websiteLive) {
  plotEnrich(enriched[[14]] %>% filter(Adjusted.P.value < 0.05), 
             title = "GO_Cellular_Component_2023", showTerms = 30, numChar = 50, y = "Count", orderBy = "Adjusted.P.value")
}

if (websiteLive) {
  plotEnrich(enriched[[15]] %>% filter(Adjusted.P.value < 0.05), 
             title = "GO_Molecular_Function_2023", showTerms = 30, numChar = 60, y = "Count", orderBy = "Adjusted.P.value")
}


if (websiteLive) {
  plotEnrich(enriched[[9]]%>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "DisGeNET" , orderBy = "Adjusted.P.value")
}

if (websiteLive) {
  plotEnrich(enriched[[11]]%>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "DrugMatrix" , orderBy = "Adjusted.P.value")
}


if (websiteLive) {
  plotEnrich(enriched[[12]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "DSigDB" , orderBy = "Adjusted.P.value")
}

if (websiteLive) {
  plotEnrich(enriched[[18]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "OMIM_Disease" , orderBy = "Adjusted.P.value")
}


if (websiteLive) {
  plotEnrich(enriched[[20]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "Reactome_2022" , orderBy = "Adjusted.P.value")
}

if (websiteLive) {
  plotEnrich(enriched[[21]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "Wikipathways_2019-Mouse" , orderBy = "Adjusted.P.value")
}


if (websiteLive) {
  plotEnrich(enriched[[2]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "Aging_Perturbations_from_GEO_down" , orderBy = "Adjusted.P.value")
}

if (websiteLive) {
  plotEnrich(enriched[[5]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "Disease_Perturbations_from_GEO_down" , orderBy = "Adjusted.P.value")
}

if (websiteLive) {
  plotEnrich(enriched[[6]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 60, y = "Count", 
             title = "Disease_Perturbations_from_GEO_up" , orderBy = "Adjusted.P.value")
}

if (websiteLive) {
  plotEnrich(enriched[[10]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 30, y = "Count", 
             title = "Drug_Perturbations_from_GEO_2014" , orderBy = "Adjusted.P.value")
}
ggsave(paste0("test", ".pdf"), width = 10, height = 8)

### analysis for each cluster separately
dbsgo <- c("GO_Biological_Process_2023",
           "GO_Cellular_Component_2023",
           "GO_Molecular_Function_2023")

for (i in unique(degs_list$cluster)){
  print(i)
  cluster_degs <- degs_list %>% filter(cluster == i)
  cluster_enriched_all <- enrichr(cluster_degs$gene, dbs2analyze) %>% 
    list_drop_empty(.) %>% 
    purrr::list_rbind(., names_to='db_name') %>% 
    filter(Adjusted.P.value < 0.05)
  write.csv(cluster_enriched_all, file = paste0("enrichment_all_p-adjusted-",i, ".csv"))
    
  cluster_enriched_go <- enrichr(cluster_degs$gene, dbsgo) 
  
  if ("GO_Biological_Process_2023" %in% cluster_enriched_all$db_name){
  
  plotEnrich(cluster_enriched_go[[1]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 40, y = "Count", 
             title = paste0("GO_Biological_Process_2023-", i) , orderBy = "Adjusted.P.value")
  ggsave(paste0("go-bp-padj-", i, ".pdf"), width = 10, height = 8)
  }
  if ("GO_Cellular_Component_2023" %in% cluster_enriched_all$db_name){
  plotEnrich(cluster_enriched_go[[2]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 40, y = "Count", 
             title = paste0("GO_Cellular_Component_2023-", i) , orderBy = "Adjusted.P.value")
  ggsave(paste0("go-cc-padj-", i, ".pdf"), width = 10, height = 8)
  }
  if ("GO_Molecular_Function_2023" %in% cluster_enriched_all$db_name){
  plotEnrich(cluster_enriched_go[[3]] %>% filter(Adjusted.P.value < 0.05), showTerms = 40, numChar = 40, y = "Count", 
             title = paste0("GO_Molecular_Function_2023-", i) , orderBy = "Adjusted.P.value")
  ggsave(paste0("go-mf-padj-", i, ".pdf"), width = 10, height = 8)
  }
}

disease_dbs <- c("Disease_Perturbations_from_GEO_down",
                 "Disease_Perturbations_from_GEO_up",
                 "DisGeNET",
                 "Human_Phenotype_Ontology",
                 "OMIM_Disease",
                 "OMIM_Expanded")

for (i in unique(degs_list$cluster)){
  print(i)
  cluster_degs <- degs_list %>% filter(cluster == i)
  cluster_enriched_disease <- enrichr(cluster_degs$gene, disease_dbs) %>% 
    list_drop_empty(.) %>% 
    purrr::list_rbind(., names_to='db_name') %>% 
    filter(Adjusted.P.value < 0.05)
  write.csv(cluster_enriched_disease, file = paste0("enrichment_dis_p-adjusted-",i, ".csv"))
  
}
