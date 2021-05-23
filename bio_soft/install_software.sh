apt-get update && apt-get install -y --no-install-recommends \
    bwa \
    bedtools \
    bcftools \
    samtools \
    seqtk \
    vcftools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
#fastp
wget http://opengene.org/fastp/fastp /usr/local/bin/
chmod a+x /usr/local/bin/fastp
#seqkit,取消网络
#wget http://app.shenwei.me/data/seqkit/seqkit_linux_amd64.tar.gz
tar -zxvf seqkit_linux_amd64.tar.gz -C /usr/local/bin && rm seqkit_linux_amd64.tar.gz
#gatk,顺便删除帮助文档
unzip gatk-4.2.0.0.zip -d /opt/ && rm gatk-4.2.0.0.zip && rm -rf /opt/gatk-4.2.0.0/gatkdoc
#sention
tar -zxvf sentieon-genomics-202010.tar.gz -C /opt/ && rm sentieon-genomics-202010.tar.gz
################VEP安装,bioperl-ext不加入
#设置cpan镜像源
if ! (
    perl -MCPAN -e 'CPAN::HandleConfig->load();' \
        -e 'CPAN::HandleConfig->prettyprint("urllist")' |
    grep -qF 'https://mirrors.tuna.tsinghua.edu.cn/CPAN/'
); then
    perl -MCPAN -e 'CPAN::HandleConfig->load();' \
        -e 'CPAN::HandleConfig->edit("urllist", "unshift", "https://mirrors.tuna.tsinghua.edu.cn/CPAN/");' \
        -e 'CPAN::HandleConfig->commit()'
fi
perl -MCPAN -e "install DBI"
cpanm Archive::Zip
cpanm DBD::mysql
cpanm PerlIO::gzip
cpanm Bio::DB::BigFile
cpanm Set::IntervalTree
cpanm JSON
#下载API
unzip ensembl-vep-release-103.zip -d /opt/ && cd /opt/ensembl-vep-release-103 && perl INSTALL.pl --AUTO a
cd / && rm ensembl-vep-release-103.zip

#vcf2maf软件安装
tar -zxvf vcf2maf-1.6.20.tar.gz -C /opt/ && cd /opt/vcf2maf-1.6.20 && chmod a+x *.pl && mv *.pl /usr/local/bin/
cd / && rm vcf2maf-1.6.20.tar.gz && rm -rf /opt/vcf2maf-1.6.20