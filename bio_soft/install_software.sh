apt-get update && apt-get install -y --no-install-recommends \
    bwa \
    bedtools \
    bcftools \
    samtools \
    seqkt \
    vcftools
#fastp
wget http://opengene.org/fastp/fastp /usr/local/bin/
chmod a+x /usr/local/bin/fastp
#seqkit
wget http://app.shenwei.me/data/seqkit/seqkit_linux_amd64.tar.gz
tar -zxvf seqkit_linux_amd64.tar.gz /usr/local/bin
#gatk
unzip gatk-4.2.0.0.zip -d /opt/ && rm gatk-4.2.0.0.zip
#sention
wget https://s3.amazonaws.com/sentieon-release/software/sentieon-genomics-202010.tar.gz | tar -zxf - -C /opt/
#VEP安装
