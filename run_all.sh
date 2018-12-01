# run_all.#!/bin/sh
# Marcelle, Nov 2018

# Runs the data pipeline for the Car Insurance analysis

# example usage:
# bash run_all.sh

# Import and clean up data
Rscript src/1_data_import.R data/carInsurance.csv data/cleanedCarInsurance.csv

# Visualize the data set
Rscript src/2_exploratory_visualization.R data/cleanedCarInsurance.csv results/visualization.png

# Perform two-group hypothesis test and save results summary and null distribution plot
Rscript src/3_hypothesis_test.R data/cleanedCarInsurance.csv results/summarized_hypothesis_test.csv results/alpha_h0_plot.png

# Render the report
Rscript -e "rmarkdown::render('report/report.Rmd')"
