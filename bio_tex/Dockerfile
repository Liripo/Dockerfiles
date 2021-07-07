FROM liripo/bio_base:v4.1.0
#使用COPY会导致增加一个大文件镜像层
#修改为wget下载，减少大小
#COPY texlive2021-20210325.iso /iso/
COPY texlive.profile /tmp
RUN wget -P /opt https://mirrors.tuna.tsinghua.edu.cn/ctan/systems/texlive/Images/texlive2021-20210325.iso \
	&& cd /iso \
	&& bsdtar -xf /iso/texlive2021-20210325.iso \
	#安装tex
	&& ./install-tl -profile /tmp/texlive.profile \
	&& rm -rf /iso \
	#删除tex源码，文档，文档占3G，源码400M，字体3G不能删除
	&& rm -rf /usr/local/texlive/2021/texmf-dist/doc/ \
	&& rm -rf /usr/local/texlive/2021/texmf-dist/source
ENV PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
RUN echo "PATH=${PATH}" >> "${R_HOME}/etc/Renviron"