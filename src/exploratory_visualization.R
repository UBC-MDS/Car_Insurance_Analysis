# load libraries
library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

#read in data
input_data = read_csv(input_file)

# visualize the data
input_data %>%
  ggplot(aes(x = CarInsurance, fill = CarInsurance)) +
  geom_bar(stat = "count", position = position_dodge()) +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.4, colour = "black") +
  facet_wrap(~Marital) +
  labs(x = "CarInsurance",
       y = "QTY") +
  theme_bw() +
  ggtitle("Breakdown of Car Insurance Data") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave(output_file)