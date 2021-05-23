# dockerfile
- bio_base是在rocker/tidyverse镜像上增加所有biocondocutor包所需要的系统依赖以及一些常用R包的。

- **bio_tex**在bio_base基础下增加Texlive。

- bio_soft是在bio_base基础下增加生信软件。（当然，安装软件很大的话大基本使用离线状态，这些文件不会上传到此仓库）

