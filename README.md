# Soybean-flooding-and-eCO2
Publication in review: Coffman, L., Hector D. Mejia, Yelinska Alicea, Raneem Mustafa, Waqar Ahmad, Kerri Crawford, Abdul Latif Khan(2023) Changes in Microbiome Structure and plant's defense responses during flooding stress and increased CO2. Frontiers in Plant Sciences.

# Data 
The data folder contains the following files: \
• 16S/<insert_file> : A QIIME2 artifact with the 16S ASV abundances for each sample. \
• 16S/taxonomy.qza: A QIIME2 artifact the taxonomic assignment for each 16S ASV. \
• 16S/rooted-tree.qza: A QIIME2 artifact containing the phylogenetic tree for the 16S ASVs. \
• 16S/shannon.qza: A QIIME2 artifact containing the shannon diversity for the 16S ASVs. \
• 16S/metadata.tsv: A table with the sample information. \
• ITS/<insert_file> : A QIIME2 artifact with the ITS ASV abundances for each sample. \
• ITS/taxonomy.qza: A QIIME2 artifact the taxonomic assignment for each ITS ASV. \
• ITS/rooted-tree.qza: A QIIME2 artifact containing the phylogenetic tree for the ITS ASVs. \
• ITS/shannon.qza: A QIIME2 artifact containing the shannon diversity for the ITS ASVs. \
• ITS/metadata.tsv: A table with the sample information. 

# Code 
The src folder contains the following R scripts: \
• 01_data_import.Rmd: Loads and processes the data, and creates phyloseq objects. \
• 02_alpha_diversity.Rmd: Calculates and plots the alpha diversity and compares the alpha diversity between the different conditions. \
• 03_beta_diversity.Rmd: Calculates and plots the beta diversity distances and ordinations and compared beta diversity among sample conditions using PERMANOVA. \
• 04_differential_abundance.Rmd: Performs differential abundance analysis using ANCOM-BC and plots log2 fold change heatmaps and barcharts. \
• 05_A_flavus_ASVs.Rmd: Plots and compares the abundance of the K49 and Tox4 ASVs in the different conditions. \
• 06_cross_domain_network_corn_diff_assoc.Rmd: Creates and compares co-occurrence networks for each Maize inbred, and identifies taxa that are correlated with Tox4 and K49 ASVs. \
• qiime2_16S_processing.sh: QIIME2 commands to denoise and trim reads and assign taxonomic classification for 16S amplicons. \
• qiime2_ITS_processing.sh QIIME2 commands to denoise and trim reads and assign taxonomic classification for ITS amplicons. 

# Output 
The output folder contains tables with ASV counts alongside their amplicon sequence taxonomy. There are also tables showing the differential abundance log2 fold change for both ITS and 16S ASVs. 

# Requirements 
To run the code, you will need R-4.2.1 and the following R packages: \
• tidyverse \
• qiime2R \
• phyloseq \
• Microbiome 
