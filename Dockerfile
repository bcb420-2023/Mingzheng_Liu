FROM risserlin/bcb420-base-image:winter2023

RUN R -e "BiocManager::install(c('DESeq2', 'pheatmap'))"
RUN R -e "install.packages('pandoc')"
