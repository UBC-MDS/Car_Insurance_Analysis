#! /usr/bin/env Rscript
# 2) exploratory_visualization.R
# Team members: Marcelle Chiriboga, Phuntsok Tseten
#
# Second script that reads the data from the first script and creates an exploratory visualization.
#
# Usage: Rscript src/exploratory_visualization.R data/cleanedCarInsurance.csv results/visualization.png

# load libraries
library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

#read in data
input_data = read_csv(input_file)

# make Marital and CarInsurance a factor
input_data <- input_data %>% 
  mutate(CarInsurance = factor(CarInsurance), Marital = factor(Marital))

# visualize the data
input_data %>%
  ggplot(aes(x = CarInsurance, fill = CarInsurance)) +
  geom_bar(stat = "count", position = position_dodge()) +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.4, colour = "black") +
  facet_wrap(~Marital) +
  labs(x = "CarInsurance",
       y = "Value") +
  theme_bw() +
  ggtitle("Relationship between car insurance purchase and marital status") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave(output_file)