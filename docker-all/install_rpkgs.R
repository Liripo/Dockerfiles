options(repos = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")
#最大300s
options(timeout = max(300, getOption("timeout")))
#可以优化，有则不下载
install_cran <- function(pkg,try_install_number = 3,quiet = T,...) {
  for (i in seq(1:try_install_number)) {
    if (!requireNamespace(pkg,quietly = T)) {
      install.packages(pkg,quiet = quiet,...)
    }
  }
  if (!requireNamespace(pkg))stop(paste0(pkg,":下载失败！"))
}

install_bio <- function(pkg,try_install_number = 10,update = F,method = "wget",extra = "-c",...) {
  for (i in seq(1:try_install_number)) {
    if (!requireNamespace(pkg,quietly = T)) {
      BiocManager::install(pkg,update = update,method = method,extra = extra,...)
    }
  }
  if (!requireNamespace(pkg))stop(paste0(pkg,":下载失败！"))
}
#install_bio("genomation")
#install_bio('GenomicRanges')
#install_bio('org.Hs.eg.db')
#install_bio('clusterProfiler')
#install_bio('DOSE')
#install_bio('topGO')
install_bio("ComplexHeatmap")
#install_bio("Organism.dplyr")


install_cran("data.table")
install_cran("dtplyr")
install_cran("Seurat")
install_cran("optparse")
install_cran("rmarkdown")
install_cran("tinytex")
install_cran("formatR")
install_cran("patchwork")
install_cran("rvest")
install_cran("furrr")
install_cran("echarts4r")
install_cran("ggsignif")
install_cran("ggpubr")
install_cran("gridExtra")
install_cran("survminer")
install_cran("survival")
install_cran("cli")
install_cran("bench")
install_cran("writexl")
install_cran("flextable")
