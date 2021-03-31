library(BiocManager)
options(repos = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")

install_cran <- function(pkg,try_install_number = 3) {
  for (i in seq(1:try_install_number)) {
    if (!requireNamespace(pkg,quietly = T)) {
      install.packages(pkg,quiet = T)
    }
  }
  if (!requireNamespace(pkg))stop(paste0(pkg,":下载失败！"))
}

install_bio <- function(pkg,try_install_number = 3) {
  for (i in seq(1:try_install_number)) {
    if (!requireNamespace(pkg,quietly = T)) {
      BiocManager::install(pkg,update = F)
    }
  }
  if (!requireNamespace(pkg))stop(paste0(pkg,":下载失败！"))
}
install_bio("genomation")
install_bio('GenomicRanges')
install_bio('org.Hs.eg.db')
install_bio("methylKit")
install_bio('clusterProfiler')
install_bio('DOSE')
install_bio('topGO')
install_bio("RnBeads")
install_bio("RnBeads.hg19")
#顺便安装texlive
#install.packages("echarts4r")
# install.packages("tinytex")
# install.packages("rmarkdown")
# tinytex::install_tinytex(dir = "/usr/bin")
# tlmgr(c("option","repository",
#         "https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet"))
# tinytex::tlmgr_install('scheme-full')