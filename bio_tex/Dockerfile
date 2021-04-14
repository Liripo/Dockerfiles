FROM bio_base:v0.1

COPY texlive2021-20210325.iso /iso/
COPY texlive.profile /tmp
RUN cd /iso \
	&& bsdtar -xf /iso/texlive2021-20210325.iso \
	#安装tex
	&& ./install-tl -profile /tmp/texlive.profile \
	&& rm -rf /iso \
	&& rm -rf /var/lib/apt/lists/*
ENV PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
ENV MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH
ENV INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH
RUN echo "PATH=${PATH}" >> "${R_HOME}/etc/Renviron"