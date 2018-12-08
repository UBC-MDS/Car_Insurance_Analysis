# Docker file for Car_Insurance_Analysis
# Marcelle Chiriboga & Phuntsok Tseten, Dec, 2018

# Description: This Dockerfile can be used to run our automatic data analysis pipeline

# Usage:
# - To build the docker image run: docker build --tag car_insurance_analysis:1.0 .
#	- To get a clean start (optional): docker run -e PASSWORD=test --rm -v <ABSOLUTE PATH OF REPO>:/home/rstudio/car_insurance_analysis car_insurance_analysis:1.0 make -C /home/rstudio/car_insurance_analysis clean
#	- To create the report: docker run -e PASSWORD=test --rm -v <ABSOLUTE PATH OF REPO>:/home/rstudio/car_insurance_analysis car_insurance_analysis:1.0 make -C /home/rstudio/car_insurance_analysis all

# Use rocker/tidyverse as the base image
FROM rocker/tidyverse

# Install R packages
RUN R -e "install.packages('infer', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('rmarkdown', repos = 'http://cran.us.r-project.org')"
RUN R -e "install.packages('broom', repos = 'http://cran.us.r-project.org')"
