FROM rocker/tidyverse:4.0.4


COPY sources.list /
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bat \
		&& mv sources.list /etc/apt/ \
		&& apt-get update \
		&& apt-get install -y vim \
	    && apt-get install -y python3-pip \
	    && ln -s /usr/bin/pip3 /usr/bin/pip \
	    && ln -s /usr/bin/python3 /usr/bin/python \
		&& pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
		&& apt-get install -y --no-install-recommends \
		less \
		&& apt-get clean \
	    && rm -rf /var/lib/apt/lists/*
		
# Update apt-get,bioconductor依赖[参考](https://github.com/Bioconductor/bioconductor_docker/blob/master/Dockerfile)
RUN apt-get update \
	&& apt-get install -y --no-install-recommends apt-utils \
	&& apt-get install -y --no-install-recommends \
	## Basic deps
	gdb \
	libxml2-dev \
	python3-pip \
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
RUN Rscript install_rpkgs.R && rm install_rpkgs.R


COPY requirements.txt /
##python模块安装
pip install -r requirements.txt && rm requirements.txt
#pretty PS1，http://bashrcgenerator.com/
#https://stackoverflow.com/questions/2953081/how-can-i-write-a-heredoc-to-a-file-in-bash-script
COPY bashrc.txt /
RUN cat bashrc.txt >> /etc/profile && rm bashrc.txt



	

		
