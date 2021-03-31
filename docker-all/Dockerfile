FROM rocker/tidyverse:4.0.4
#pretty PS1，http://bashrcgenerator.com/
#https://stackoverflow.com/questions/2953081/how-can-i-write-a-heredoc-to-a-file-in-bash-script
COPY bashrc.txt /
RUN cat bashrc.txt >> /etc/profile && rm bashrc.txt


RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
		&& apt-get clean \
		&& apt-get update \
		&& apt-get install -y vim \
	    && apt-get install -y python3-pip \
		&& apt-get install -y vim \
	    && ln -s /usr/bin/pip3 /usr/bin/pip \
	    && ln -s /usr/bin/python3 /usr/bin/python \
		&& pip install pip -U \
		&& pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
		&& apt-get install -y libbz2-dev

COPY install_rpkgs.R /
RUN Rscript install_rpkgs.R && rm install_rpkgs.R

COPY requirements.txt /
##python模块安装

		

	

		
