FROM rocker/tidyverse:4.0.3

#安装所需R包,安装过程很糟糕，才写成这样的。
#还有怎么解决安装github上的东西的网络问题？？下到本地还有依赖也要解决。
RUN sudo su - \
		-c "R -e \"install.packages(c('sodium','rappdirs')); \
		install.packages('shiny', repos='https://cran.rstudio.com/'); \
		install.packages('shinydashboard', repos='https://cran.rstudio.com/'); \
		install.packages('shinydashboardPlus', repos='https://cran.rstudio.com/'); \
		\"" \
	&& echo "install.packages(c('shinymanager','bs4Dash',\
        'pool','shinyjs','polished','glue','shinyalert','promises','future'), \
        repos='http://cran.rstudio.com/',dependencies=TRUE); \
        " > /tmp/packages.R \
  && Rscript /tmp/packages.R \
  && rm -rf /tmp/bs4Dash /tmp/packages.R
#/tmp文件是否会删除？？
#更换apt源，而且apt-get每次使用前需要apt-get update,比如构建新镜像。
#apt-get增加-y参数等，Dockerfile最好不要用交互模式
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
		&& apt-get clean \
		&& apt-get update \
		&& apt-get install -y gdebi-core

#安装shinyserver，取消网络依赖
COPY shiny-server-1.5.15.953-amd64.deb ./
RUN gdebi -n shiny-server-1.5.15.953-amd64.deb && \
    rm -f shiny-server-1.5.15.953-amd64.deb && \
    . /etc/environment && \
    cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/ && \
    chown shiny:shiny /var/lib/shiny-server
#声明shiny-server 3838端口，rstudio为8787端口
EXPOSE 3838

COPY shiny-server.sh /usr/bin/shiny-server.sh
#默认启用rstuio,具体看[rstudio-dockerfile](https://hub.docker.com/r/rocker/rstudio/dockerfile)
