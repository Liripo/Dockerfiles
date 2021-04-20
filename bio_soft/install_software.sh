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
#seqkit
wget http://app.shenwei.me/data/seqkit/seqkit_linux_amd64.tar.gz
tar -zxvf seqkit_linux_amd64.tar.gz /usr/local/bin
#gatk
unzip gatk-4.2.0.0.zip -d /opt/ && rm gatk-4.2.0.0.zip
#sention
tar -zxvf sentieon-genomics-202010.tar.gz -C /opt/ && rm sentieon-genomics-202010.tar.gz
################VEP安装,功能未安装完全
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
cpan App::cpanminus
cpanm Archive::Zip