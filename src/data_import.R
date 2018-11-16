# load libraries
library(tidyverse)
library(infer)

#read car_insurance data
car_insurance = read_csv("../data/carInsurance.csv")
head(car_insurance, 10)
