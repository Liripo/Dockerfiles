FROM rocker/tidyverse:4.0.4
#pretty PS1，http://bashrcgenerator.com/
#https://stackoverflow.com/questions/2953081/how-can-i-write-a-heredoc-to-a-file-in-bash-script
RUN cat<<-'HERE' >>/etc/profile
function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch \n $__prompt_tail$__last_color "
}
color_my_prompt
HERE

COPY install_rpkgs.R /
RUN Rscript install_rpkgs.R && rm install_rpkgs.R

COPY requirements.txt /
##python模块安装
RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
		&& apt-get clean \
		&& apt-get update \
		&& apt-get install -y vim \
	    && apt-get install -y python3-pip \
	    && ln -s /usr/bin/pip3 /usr/bin/pip \
	    && ln -s /usr/bin/python3 /usr/bin/python \
		&& pip install pip -U \
		&& pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
	    && pip install -r requirements.txt && rm requirements.txt
		

	

		
