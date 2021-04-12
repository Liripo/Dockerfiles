FROM liripo/base_all:v1

COPY deg_enrich.v2.5.r /usr/local/bin/rna_script/
COPY install_rpkgs.R /
RUN Rscript install_rpkgs.R && rm install_rpkgs.R