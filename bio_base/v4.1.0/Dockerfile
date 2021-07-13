FROM rocker/tidyverse:4.1.0
LABEL maintainer="liripo(liripo@qq.com)"

COPY copy_files /tmp
RUN cat /tmp/bashrc >>~/.bashrc && rm /tmp/bashrc && cat /tmp/profile >> /etc/profile && rm /tmp/profile && \
    cp ~/.bashrc /.bashrc && chmod 777 /.bashrc

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bat \
		&& mv /tmp/sources.list /etc/apt/ \
		&& apt-get update \
		&& apt-get install -y vim \
		# 不要将推荐的软件包视为安装的依赖项
		&& apt-get install -y --no-install-recommends \
		libarchive-tools \
		ghostscript \
		fontconfig \
		python3-pip \
		less \
		## [增加所有bioconductor包的依赖](https://github.com/Bioconductor/bioconductor_docker/blob/master/Dockerfile)
		apt-utils \
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
	    && ln -s /usr/bin/python3 /usr/bin/python \
		&& pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
		&& apt-get clean \
	    && rm -rf /var/lib/apt/lists/*
#安装字体，微软雅黑，宋体
#COPY fonts/* /usr/share/fonts/
#RUN fc-cache -vf

#python模块
RUN pip install -r /tmp/requirements.txt && rm /tmp/requirements.txt
#时区上海
ENV TZ=Asia/Shanghai
COPY install_rpkgs.R /
#安装R包
RUN Rscript install_rpkgs.R && rm install_rpkgs.R
