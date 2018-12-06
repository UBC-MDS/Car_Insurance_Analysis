#! /usr/bin/env Rscript
# 3_hypothesis_test.R
# Team members: Marcelle Chiriboga, Phuntsok Tseten
#
# Third script that reads the data from the first script, 
# performs a hypothesis test and writes these numerical data to file in .csv format. 
#
# Usage: Rscript src/3_hypothesis_test.R data/cleanedCarInsurance.csv results/summarized_hypothesis_test.csv results/alpha_h0_plot.png

# load libraries
library(tidyverse)
library(infer)

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]
plot_file <- args[3]

# read in data
input_data = read_csv(input_file)

# analyze the data
# get estimates
input_data_est <- input_data %>%
  group_by(Marital) %>%
  summarize(CarInsurance_rate = sum(CarInsurance)/n())

# get diff (delta*) of values in CarInsurance_rate column 
(delta_sample <- diff(input_data_est$CarInsurance_rate))

# make Marital and CarInsurance a factor
input_data <- input_data %>% 
  mutate(CarInsurance = factor(CarInsurance), Marital = factor(Marital))

# generate the simulated data under the model  null hypothesis.
# For each simulated sample, calculate a test statistic.
set.seed(2018)
null_distribution_marital <- input_data %>% 
  specify(formula = CarInsurance ~ Marital, success = "1")  %>% 
  hypothesize(null = "independence") %>% 
  generate(reps = 15000)  %>% 
  calculate(stat = "diff in props", order = c("married", "not-married"))

# null hypothesis distribution visualization
h0_dist <- null_distribution_marital %>% visualize()

# add alpha on H0 distribution
threshold <- quantile(null_distribution_marital$stat, c(0.025, 0.975))

ci_lower <- threshold[[1]]
ci_upper <- threshold[[2]]

h0_dist <- h0_dist + geom_vline(xintercept = c(ci_lower, ci_upper), 
                                 color = "blue",
                                 lty = 2)

# visualize delta* on H0 distribution
(h0_dist <- h0_dist +
    geom_vline(xintercept = delta_sample, color = "red"))

# calculate p-value with infer
p_value <- null_distribution_marital %>% 
  get_pvalue(obs_stat = delta_sample, direction = "both")


# calculate p-value "manually"
# p_value <- sum(abs(null_distribution_marital$stat) >= abs(delta_sample))/15000

car_insurance_summary <- data.frame("delta*" = delta_sample, 
                                    "p.value" = p_value,
                                    "alpha" = 0.05, 
                                    "ci.lower" = ci_lower, 
                                    "ci.upper" = ci_upper)

# save car_insurance_summarydata to output_file
write_csv(car_insurance_summary, output_file)

# save plot with alpha to plot_file
ggsave(plot_file)



