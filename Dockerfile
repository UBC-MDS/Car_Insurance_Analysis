# Docker file for data_analysis_pipeline_eg
# Marcelle Chiriboga & Phuntsok Tseten, Dec, 2018

# use rocker/tidyverse as the base image
FROM rocker/tidyverse

RUN R -e "install.packages('infer', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('rmarkdown', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('broom', repos = 'http://cran.us.r-project.org')"
