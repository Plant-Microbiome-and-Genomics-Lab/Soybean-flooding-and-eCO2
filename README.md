# Soybean-flooding-and-eCO2
Publication in review: Coffman, L., Hector D. Mejia, Yelinska Alicea, Raneem Mustafa, Waqar Ahmad, Kerri Crawford, Abdul Latif Khan(2023) Changes in Microbiome Structure and plant's defense responses during flooding stress and increased CO2. Frontiers in Plant Sciences.

# Data 
The data folder contains the following files: \
• 16S/filtered-table-F001 : A QIIME2 artifact with the 16S ASV abundances for soil. \
• 16S/filtered-table-root-F002 : A QIIME2 artifact with the 16S ASV abundances for root. \
• 16S/filtered-table-shoot-F002 : A QIIME2 artifact with the 16S ASV abundances for shoot. \
• 16S/filtered-rep-seqs-F001 : A QIIME2 artifact with the 16S ASV abundances for soil. \
• 16S/filtered-rep-seqs-F002 : A QIIME2 artifact with the 16S ASV abundances for shoot & root. \
• 16S/taxonomy-F001.qza: A QIIME2 artifact the taxonomic assignment for soil 16S ASV. \
• 16S/taxonomy-F002.qza: A QIIME2 artifact the taxonomic assignment for root and shoot 16S ASV. \
• 16S/rooted-tree-F001.qza: A QIIME2 artifact containing the phylogenetic tree for the soil 16S ASVs. \
• 16S/rooted-tree-F002.qza: A QIIME2 artifact containing the phylogenetic tree for the root and shoot 16S ASVs. \
• 16S/shannon_vector_F001.qza: A QIIME2 artifact containing the shannon diversity for the soil 16S ASVs. \
• 16S/shannon_vector_root_F002.qza: A QIIME2 artifact containing the shannon diversity for the root 16S ASVs. \
• 16S/shannon_vector_shoot_F002.qza: A QIIME2 artifact containing the shannon diversity for the shoot 16S ASVs. \
• 16S/metadata_F001.tsv: A table with the soil sample information. \
• 16S/metadata_F002.tsv: A table with the root and shoot sample information. \
• ITS/filtered-table-F005 : A QIIME2 artifact with the ITS ASV abundances for soil. \
• ITS/filtered-table-root-F003 : A QIIME2 artifact with the ITS ASV abundances for root. \
• ITS/filtered-table-shoot-F003 : A QIIME2 artifact with the ITS ASV abundances for shoot. \
• ITS/filtered-rep-seqs-F005 : A QIIME2 artifact with the ITS ASV abundances for soil. \
• ITS/filtered-rep-seqs-F003 : A QIIME2 artifact with the ITS ASV abundances for shoot & root. \
• ITS/taxonomy-F005.qza: A QIIME2 artifact the taxonomic assignment for soil ITS ASV. \
• ITS/taxonomy-F003.qza: A QIIME2 artifact the taxonomic assignment for root and shoot ITS ASV. \
• ITS/rooted-tree-F005.qza: A QIIME2 artifact containing the phylogenetic tree for the soil ITS ASVs. \
• ITS/rooted-tree-F003.qza: A QIIME2 artifact containing the phylogenetic tree for the root and shoot ITS ASVs. \
• ITS/shannon_vector_F005.qza: A QIIME2 artifact containing the shannon diversity for the soil ITS ASVs. \
• ITS/shannon_vector_root_F003.qza: A QIIME2 artifact containing the shannon diversity for the root ITS ASVs. \
• ITS/shannon_vector_shoot_F003.qza: A QIIME2 artifact containing the shannon diversity for the shoot ITS ASVs. \
• ITS/metadata_F005.tsv: A table with the soil sample information. \
• ITS/metadata_F003.tsv: A table with the root and shoot sample information. \

# Code 
The src folder contains the following R scripts: \
• Figures.Rmd: Creation of figures using R \
• qiime2_16S_processing.sh: QIIME2 commands to denoise and trim reads and assign taxonomic classification for 16S amplicons. \
• qiime2_ITS_processing.sh QIIME2 commands to denoise and trim reads and assign taxonomic classification for ITS amplicons. 

# Requirements 
To run the code, you will need R-4.2.1 and the following R packages: \
• tidyverse \
• qiime2R \
• phyloseq \
• microbiome \
• dplyr \
• vegan \
• ggplot2 \
• microViz \
• eulerr \
• microbiomeSeq \
• microbial \
• plotly \
• picante \
• ANCOMBC \
• kableExtra \
• apeglm \
• knitr \
• ggpubbr \
• MicrobeR \
• microbiomeutilities \
• RColorBrewer \
• Glimma
