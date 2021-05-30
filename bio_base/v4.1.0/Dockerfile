FROM rocker/tidyverse:4.1.0
LABEL maintainer="liripo(liripo@qq.com)"

ENV PS1="\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \[\033[31m\]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /` \n \[\033[35m\]$\[\033[00m\] "
COPY sources.list /
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bat \
		&& mv sources.list /etc/apt/ \
		&& apt-get update \
		&& apt-get install -y vim \
		&& apt-get install -y --no-install-recommends \
		#编程连字字体
		fonts-firacode \
		#使用思源黑体，<https://www.fyears.org/2017/04/source-han-sans-and-source-han-serif.html>
		fonts-noto-cjk \
		libarchive-tools \
		ghostscript \
		fontconfig \
		python3-pip \
		less \
	    && ln -s /usr/bin/python3 /usr/bin/python \
		&& pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
		&& apt-get clean \
	    && rm -rf /var/lib/apt/lists/* \
		&& fc-cache -vf
#安装字体，微软雅黑，宋体
#COPY fonts/* /usr/share/fonts/
#RUN fc-cache -vf
		
# Update apt-get,bioconductor依赖[参考](https://github.com/Bioconductor/bioconductor_docker/blob/master/Dockerfile)
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install -y --no-install-recommends \
	## Basic deps
	gdb \
	libxml2-dev \
	libz-dev \
	liblzma-dev \
	libbz2-dev \
	libpng-dev \
	libgit2-dev \
	## sys deps from bioc_full
	pkg-config \
	fortran77-compiler \
	byacc \
	automake \
	curl \
	## This section installs libraries
	libpcre2-dev \
	libnetcdf-dev \
	libhdf5-serial-dev \
	libfftw3-dev \
	libopenbabel-dev \
	libopenmpi-dev \
	libxt-dev \
	libudunits2-dev \
	libgeos-dev \
	libproj-dev \
	libcairo2-dev \
	libtiff5-dev \
	libreadline-dev \
	libgsl0-dev \
	libgslcblas0 \
	libgtk2.0-dev \
	libgl1-mesa-dev \
	libglu1-mesa-dev \
	libgmp3-dev \
	libhdf5-dev \
	libncurses-dev \
	libbz2-dev \
	libxpm-dev \
	liblapack-dev \
	libv8-dev \
	libgtkmm-2.4-dev \
	libmpfr-dev \
	libmodule-build-perl \
	libapparmor-dev \
	libprotoc-dev \
	librdf0-dev \
	libmagick++-dev \
	libsasl2-dev \
	libpoppler-cpp-dev \
	libprotobuf-dev \
	libpq-dev \
	libperl-dev \
	## software - perl extentions and modules
	libarchive-extract-perl \
	libfile-copy-recursive-perl \
	libcgi-pm-perl \
	libdbi-perl \
	libdbd-mysql-perl \
	libxml-simple-perl \
	libmysqlclient-dev \
	default-libmysqlclient-dev \
	libgdal-dev \
	## new libs
	libglpk-dev \
	## Databases and other software
	sqlite \
	openmpi-bin \
	mpi-default-bin \
	openmpi-common \
	openmpi-doc \
	tcl8.6-dev \
	tk-dev \
	default-jdk \
	imagemagick \
	tabix \
	ggobi \
	graphviz \
	protobuf-compiler \
	jags \
	## Additional resources
	xfonts-100dpi \
	xfonts-75dpi \
	biber \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
	
#时区上海
ENV TZ=Asia/Shanghai
COPY install_rpkgs.R /
#安装R包
RUN Rscript install_rpkgs.R && rm install_rpkgs.R

#python模块
COPY requirements.txt /
RUN pip install -r requirements.txt && rm requirements.txt
