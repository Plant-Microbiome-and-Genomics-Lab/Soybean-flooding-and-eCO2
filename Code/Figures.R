suppressPackageStartupMessages({
  library(qiime2R)
  library(tidyverse)
  library(dplyr)
  library(vegan)
  library(phyloseq)
  library(ggplot2)
  library(DESeq2)
  library(microViz)
  library(eulerr)
  library(microbiomeSeq)
  library(microbial)
  library(plotly)
  library(microbiome)
  library(picante)
  library(ALDEx2)
  library(ANCOMBC)
  library(kableExtra)
  library(apeglm)
  library(knitr)
  library(ggpubr)
  library(MicrobeR)
  library(ggpubr)
  library(microbiomeutilities)
  library(RColorBrewer)
  library(Glimma)
})

#################Shannon_Bar Plot#################
##################################################

metadata <- read_q2metadata("metadata_F003.tsv")
shannon <- read_qza("shannon_vector_shoot_F003.qza")

shannon <- shannon$data %>% rownames_to_column("SampleID")
metadata <- metadata %>% left_join(shannon)

con_v_flood_shan <- metadata %>%
  filter(treatment != "eCO2", treatment != "flood+CO2")
con_v_CO_shan <- metadata %>% 
  filter(treatment != "flooding", treatment != "flood+CO2")

con_v_CO_shan %>%
  dplyr::filter(!is.na(shannon_entropy)) %>%
  ggplot(aes(x=`treatment`, y=shannon_entropy, fill=`treatment`)) +
  stat_summary(geom="bar", fun.data=mean_se, color="black") + #here black is the outline for the bars
  geom_jitter(shape=21, width=0.2, height=0) +
  coord_cartesian(ylim=c(0,7)) + # adjust y-axis
  facet_grid(~`location`) + # create a panel for each body site
  ggtitle(" ") +
  xlab("Treatment") +
  ylab("Shannon Diversity") +
  theme_q2r() +
  scale_fill_manual(values=c("cornflowerblue","indianred", "green", "yellow")) + #specify custom colors
  theme(legend.position="none") #remove the legend as it isn't needed

ggsave("Shannon_Con_v_eCO_shoot_its.pdf", height=4, width=4, device="pdf") # save a PDF 3 inches by 4 inches


###############Bray Curtis################
#################################################

braycurtis <-read_qza("bray_curtis_pcoa_shoot_F003.qza")

braycurtis$data$Vectors %>%
  select(SampleID, PC1, PC2) %>%
  left_join(metadata) %>%
  left_join(shannon) %>%
  ggplot(aes(x=PC1, y=PC2, color=`treatment`, shape=`location`, size=shannon_entropy)) +
  geom_point(alpha=0.5) + #alpha controls transparency and helps when points are overlapping
  ggtitle("ITS Bray Curtis Shoot") +
  theme_q2r() +
  scale_shape_manual(values=c(16,1), name="treatment") + #see http://www.sthda.com/sthda/RDoc/figure/graphs/r-plot-pch-symbols-points-in-r.png for numeric shape codes
  scale_size_continuous(name="Shannon Diversity") +
  scale_color_discrete(name="Treatment")
ggsave("bray-curtis-PCoA-shoot-F003.pdf", height=4, width=5, device="pdf") # save a PDF 3 inches by 4 inches
ggsave("bray-curtis-PCoA-shoot-F003.png", height=4, width=5, device="png", dpi=300)

#################PERMANOVA##################################
##########Run on Distance Matrix for PCoA###################
set.seed(1064)

#get distance matrix from PCoA
dist <- get_dist(phyloseq, distmethod ="bray", method="hellinger")

# make a data frame from the sample_data
meta <- data.frame(sample_data(phyloseq), check.names = FALSE)

adores <- adonis2(dist ~ treatment, data=meta, permutation=9999)

print(adores)

write.csv(adores,"permanova_F003_shoot.csv")

################# Plot Genus Level#################
##########################################################

metadata_q2r<-read_q2metadata("metadata_F003.tsv")
SVs_q2r<-read_qza("filtered-table-shoot-F003.qza")$data
taxonomy_q2r<-read_qza("taxonomy-F001.qza")$data %>% parse_taxonomy()

taxasums_Genus<-summarize_taxa(SVs_q2r, taxonomy_q2r)$Genus

taxa_heatmap(taxasums_Genus, metadata_q2r, "treatment")

ggsave("heatmap-genus-shoot-F003.pdf", height=4, width=8, device="pdf") # save a PDF 4 inches by 8 inches
ggsave("heatmap-genus-shoot-F003.png", height=4, width=8, device="png", dpi=300)

taxa_barplot(taxasums_Genus, metadata_q2r, "treatment")

ggsave("barplot-genus-shoot-F003.pdf", height=4, width=10, device="pdf") # save a PDF 4 inches by 8 inches
ggsave("barplot-genus-shoot-F003.png", height=4, width=10, device="png", dpi=300)

################# Plot Phylum Level#################
###########################################################

taxasums_Phylum <-summarize_taxa(SVs_q2r, taxonomy_q2r)$Phylum

taxa_heatmap(taxasums_Phylum, metadata_q2r, "treatment")

ggsave("heatmap-phylum-shoot-F003.pdf", height=4, width=5, device="pdf") # save a PDF 4 inches by 8 inches
ggsave("heatmap-phylum-shoot-F003.png", height=4, width=5, device="png", dpi=300)

taxa_barplot(taxasums_Phylum, metadata_q2r, "treatment")

ggsave("barplot-phylum-shoot-F003.pdf", height=4, width=5, device="pdf") # save a PDF 4 inches by 8 inches
ggsave("barplot-phylum-shoot-F003.png", height=4, width=5, device="png", dpi=300)

################# Family Level#################
#####################################################

taxasums_family<-summarize_taxa(SVs_q2r, taxonomy_q2r)$Family

taxa_heatmap(taxasums_family, metadata_q2r, "treatment")

ggsave("heatmap-family-shoot-F003.pdf", height=4, width=8, device="pdf") # save a PDF 4 inches by 8 inches
ggsave("heatmap-family-shoot-F003.png", height=4, width=8, device="png", dpi=300)

taxa_barplot(taxasums_family, metadata_q2r, "treatment")

ggsave("barplot-family-shoot-F003.pdf", height=4, width=10, device="pdf") # save a PDF 4 inches by 8 inches
ggsave("barplot-family-shoot-F003.png", height=4, width=10, device="png", dpi=300)

relative_abd_Phylum <-make_percent(taxasums_Phylum)
relative_abd_Family <- make_percent(taxasums_family)
relative_abd_Genus <- make_percent(taxasums_Genus)

#Load data into phyloseq
ps_its <- qza_to_phyloseq("filtered-table-root-F003.qza", "rooted-tree-F003.qza", 
                          "taxonomy-F003.qza", "metadata_F003.tsv")
ps_16 <- qza_to_phyloseq("filtered-table-F005.qza", "rooted-tree-F005.qza", 
                         "taxonomy-F005.qza", "metadata-F005.tsv")
ps_shoot <- qza_to_phyloseq("filtered-table-shoot-F003.qza", "rooted-tree-F003.qza", 
                            "taxonomy-F003.qza", "metadata_F003.tsv")


#Collapse Taxonomy
ps.collapse <-tax_glom(ps_its, "Genus")
ps.collapse_16 <- tax_glom(ps_16, "Genus")
ps.collapse_shoot <- tax_glom(ps_shoot, "Genus")

ps.prune = filter_taxa(ps.collapse, function(x) mean(x) > 10, TRUE)
ps.prune_16 = filter_taxa(ps.collapse_16, function(x) mean(x) >10, TRUE)
ps.prune_shoot = filter_taxa(ps.collapse_shoot, function(x) mean(x) >10, TRUE)

#make reads relative abd
ps_rel_abd <- microbiome::transform(ps.prune, "compositional")
ps_rel_abd_16 <- microbiome::transform(ps.prune_16S, "compositional")

#subset data to treatments
#Root
Con_v_flood <- ps_filter(ps_its, treatment != "eCO2", treatment != "flood+CO2")
Con_v_eCO <- ps_filter(ps_its, treatment != "flooding", treatment != "flood+CO2")

#Soil
Con_v_flood_16 <- ps_filter(ps.prune_16, treatment != "eCO2", treatment != "Flooding+eCO2")
Con_v_eCO_16 <- ps_filter(ps.prune_16, treatment != "Flooding", treatment != "Flooding+eCO2")

#Shoot
Con_v_flood_shoot <- ps_filter(ps.prune_shoot, treatment != "eCO2", treatment != "flood+CO2")
Con_v_eCO_shoot <- ps_filter(ps.prune_shoot, treatment != "flooding", treatment != "flood+CO2")


####################### ANCOM-BC2 ##########################
############################################################

ancom_data <- ancombc2(phyloseq, tax_level = "Genus", group = "treatment", p_adj_method = "fdr", 
                       fix_formula = "treatment", pairwise = TRUE, alpha = 0.05, global = TRUE,
                       dunnet = TRUE)

ancom_res <- ancom_data$res

# select the bottom 20 with lowest p values
ps.taxa.rel <- transform_sample_counts(phyloseq, function(x) x/sum(x)*100)

res.or_p <- rownames(ancom_res$q_val["treatment"])[base::order(ancom_res$q_val[,"treatment"])]
taxa_sig <- res.or_p[1:20]
ps.taxa.rel.sig <- prune_taxa(taxa_sig, ps.taxa.rel)

