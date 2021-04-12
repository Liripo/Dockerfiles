library(BiocManager)
options(repos = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")
#大文件下载
options(timeout = max(300, getOption("timeout")))
install_cran <- function(pkg,try_install_number = 3,...) {
  for (i in seq(1:try_install_number)) {
    if (!requireNamespace(pkg,quietly = T)) {
      install.packages(pkg,quiet = T,...)
    }
  }
  if (!requireNamespace(pkg))stop(paste0(pkg,":下载失败！"))
}

install_bio <- function(pkg,try_install_number = 10,...) {
  for (i in seq(1:try_install_number)) {
    if (!requireNamespace(pkg,quietly = T)) {
      BiocManager::install(pkg,update = F,...)
    }
  }
  if (!requireNamespace(pkg))stop(paste0(pkg,":下载失败！"))
}
install_bio("AnnotationHub")
#断点续传
install_bio("ReactomePA",method="wget",extra="-c")
install_cran("optparse")
