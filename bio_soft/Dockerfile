FROM liripo/bio_base:v0.1
COPY install_software.sh /
COPY gatk-4.2.0.0.zip /
COPY sentieon-genomics-202010.tar.gz /
COPY ensembl-vep-release-103.zip /
RUN bash install_software.sh && rm install_software.sh
ENV PATH="/opt/gatk-4.2.0.0:/opt/sentieon-genomics-202010/bin/:$PATH"
#VEP安装
