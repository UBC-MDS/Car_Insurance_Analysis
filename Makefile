# Marcelle

all : report/report.pdf

data/cleanedCarInsurance.csv : data/carInsurance.csv src/data_import.R
	Rscript src/data_import.R data/carInsurance.csv data/cleanedCarInsurance.csv

results/visualization.png : data/cleanedCarInsurance.csv src/exploratory_visualization.R
	Rscript src/exploratory_visualization.R data/cleanedCarInsurance.csv results/visualization.png

results/summarized_hypothesis_test.csv : data/cleanedCarInsurance.csv src/hypothesis_test.R
	Rscript src/hypothesis_test.R data/cleanedCarInsurance.csv results/summarized_hypothesis_test.csv results/alpha_h0_plot.png

results/alpha_h0_plot.png : data/cleanedCarInsurance.csv src/hypothesis_test.R
	Rscript src/hypothesis_test.R data/cleanedCarInsurance.csv results/summarized_hypothesis_test.csv results/alpha_h0_plot.png

report/report.pdf : report/report.Rmd results/visualization.png results/summarized_hypothesis_test.csv results/alpha_h0_plot.png
	Rscript -e "rmarkdown::render('report/report.Rmd')"

clean :
	rm -f data/cleanedCarInsurance.csv
	rm -f results/visualization.png
	rm -f results/summarized_hypothesis_test.csv
	rm -f results/alpha_h0_plot.png
	rm -f report/report.pdf
