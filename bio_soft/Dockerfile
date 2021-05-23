FROM liripo/bio_base:v0.1
COPY install_software.sh /
COPY gatk-4.2.0.0.zip /
COPY sentieon-genomics-202010.tar.gz /
COPY ensembl-vep-release-103.zip /
COPY vcf2maf-1.6.20.tar.gz /
COPY seqkit_linux_amd64.tar.gz /
RUN bash install_software.sh && rm install_software.sh
ENV PATH="/opt/gatk-4.2.0.0:/opt/sentieon-genomics-202010/bin/:/opt/ensembl-vep-release-103:$PATH"
