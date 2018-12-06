#! /usr/bin/env Rscript
# 1_data_import.R
# Team members: Marcelle Chiriboga, Phuntsok Tseten
#
# First script that takes in the raw Car Insurance data and cleans it into a data set that fits our research question.
#
# Usage: Rscript src/1_data_import.R data/carInsurance data/cleanedCarInsurance.csv


# load libraries
library(tidyverse)
library(infer)

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

#read in data
input_data = read_csv(input_file)

# wrangle input_data to clean it up

input_data$Marital[input_data$Marital == "married"] <- "married"
input_data$Marital[input_data$Marital != "married"] <- "not-married"

cleaned_data <- input_data %>% 
  select(Id, Marital, CarInsurance)
  
# save wrangled input_data to output_file
write_csv(cleaned_data, output_file)