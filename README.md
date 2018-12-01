# DSCI_522_Car_Insurance_Analysis


Contributors:

- [Marcelle Araujo Chiriboga Carvalho](http://github.ubc.ca/mchirib)
- [Phuntsok Tseten](http://github.ubc.ca/ptseten)

## Overview

## O. Introduction
Accidents can happen anytime, so having a car insurance is crucial but buying a car insurance can be a daunting task. The dire need of car insurance arises because nobody can predict when an accident might occur in the future. Buying a car insurance not only gives you peace of mind but it also shields you from any unfortunate incidents on the road.

In our research, we want to understand how marital status plays a role in influencing a person's decision to buy car insurance when they are cold called by a car insurance company. 

In order to address and answer this question, we performed a Hypothesis test on different groups of people with different marital statuses, and calculated the different proportions of their acceptance of  car insurance.

### 1. Data set

This project works with the [Car Insurance Cold Calls data set, from Kaggle](https://www.kaggle.com/kondla/carinsurance#carInsurance_test.csv). It contains data about 4000 customers for a bank in the USA that received cold calls offering car insurance services. The dataset also includes the outcomes of said calls, i.e. if the customers acquired car insurance or not as a result of the call.

The data set can be loaded into R with the data_import.R script that is included in the [src folder](/src). The data set itself – carInsurance.csv – is stored in the [data folder](/data).

### 2. Exploratory Analysis

The purpose of this project is to carry out an exploratory analysis to identify if there is any relationship between a customer's marital status and their likelihood to acquire car insurance after receiving a cold call.

### 3. Analysis Plan

In order to answer the question formulated in the previous section, we perform a hypothesis test to assess if groups with different marital status show different proportions in their acceptance of the car insurance offered.

In the chosen data set, customers are classified as `married`, `single`, or `divorced`. Since we will perform a two-group hypothesis test, as a first step in our analysis, we will break down the customers into two groups, `married` and `not-married`, where the latter includes `single` and `divorced` individuals.

Thus, the null and alternative hypothesis are:

$H_0$: Acceptance rate of car insurance offers for married individuals is no different than the acceptance rate for non-married individuals.

$H_A$: Acceptance rate of car insurance offers for married individuals is different than the acceptance rate for non-married individuals.

### 4. Reporting

To  report the results of our analysis we will compute the acceptance rate of car insurance offers matching the null hypothesis and use a model of $H_0$ to generate a null hypothesis distribution. Then, by plotting the distributions for both groups, we can evaluate where the test statistics falls on the distributions and determine whether we can reject the null hypothesis.We chose our alpha(significance level) to be 0.05.

To report the results of our analysis we compute the acceptance rate of car insurance offers matching the null hypothesis and use a model of $H_0$ to generate a null hypothesis distribution. Then, by plotting the distributions for both groups, we evaluate where the test statistics falls on the distributions and determine whether we can reject the null hypothesis.

The report can be accessed at https://github.com/UBC-MDS/Car_Insurance_Analysis/blob/master/report/report.pdf

## Usage

This project contains four mains steps including data cleaning, exploratory data analysis, statistical analysis (hypothesis test) and final report.

![](Flowchart.png)

To run the data analysis pipeline execute the following command in the terminal, at the root of the project

```
bash run_all.sh
```

The report will be rendered into a PDF document in the `report` folder

## Dependencies

R version 3.5.1

- library(ggplot2)
- library(tidyverse)
- library(broom)


## Releases
 - [V1.0](https://github.com/UBC-MDS/Car_Insurance_Analysis/releases/tag/v1.0) Proposal
 - [V2.0.2](https://github.com/UBC-MDS/Car_Insurance_Analysis/releases/tag/v2.0.2) Milestone 1

