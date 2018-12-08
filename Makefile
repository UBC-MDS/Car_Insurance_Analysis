# Makefile file for Car_Insurance_Analysis
# Marcelle Chiriboga & Phuntsok Tseten, Dec, 2018

# Description: This Makefile can be used to run our automatic data analysis pipeline

# Usage:
#	- To get a clean start (optional): make clean
#	- To create the report: make all

# Run all analysis
all : report/report.md

# Clean raw data
data/cleanedCarInsurance.csv : data/carInsurance.csv src/1_data_import.R
	Rscript src/1_data_import.R data/carInsurance.csv data/cleanedCarInsurance.csv

# Generate EDA visualizations
results/visualization.png : data/cleanedCarInsurance.csv src/2_exploratory_visualization.R
	Rscript src/2_exploratory_visualization.R data/cleanedCarInsurance.csv results/visualization.png

# Output results in a summary table
results/summarized_hypothesis_test.csv : data/cleanedCarInsurance.csv src/3_hypothesis_test.R
	Rscript src/3_hypothesis_test.R data/cleanedCarInsurance.csv results/summarized_hypothesis_test.csv results/alpha_h0_plot.png

# Generate a null hypothesis distribution visualization
results/alpha_h0_plot.png : data/cleanedCarInsurance.csv src/3_hypothesis_test.R
	Rscript src/3_hypothesis_test.R data/cleanedCarInsurance.csv results/summarized_hypothesis_test.csv results/alpha_h0_plot.png

# Render report into .md
report/report.md : report/report.Rmd results/visualization.png results/summarized_hypothesis_test.csv results/alpha_h0_plot.png
	Rscript -e "rmarkdown::render('report/report.Rmd')"

# Clean all output files generated
clean :
	rm -f data/cleanedCarInsurance.csv
	rm -f results/visualization.png
	rm -f results/summarized_hypothesis_test.csv
	rm -f results/alpha_h0_plot.png
	rm -f report/report.md
	rm -f report/report.html
	rm -f Rplots.pdf
