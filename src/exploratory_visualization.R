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
  mutate(CarInsurance = factor(CarInsurance, levels = c(0, 1), labels = c("Offer Refused", "Bought")), Marital = factor(Marital))

# visualize the data
input_data %>%
  ggplot(aes(x = CarInsurance, fill = CarInsurance)) +
  geom_bar(aes(y = (..count..)/sum(..count..)), position = position_dodge(), show.legend = FALSE) +
  geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25) +  facet_wrap(~Marital) +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "CarInsurance", y = "Percent") +
  theme_bw() +
  ggtitle("Relationship between car insurance purchase and marital status") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave(output_file)