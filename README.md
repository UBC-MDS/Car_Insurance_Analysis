# DSCI_522_Car_Insurance_Analysis


Contributors:

- [Marcelle Araujo Chiriboga Carvalho](http://github.ubc.ca/mchirib)
- [Phuntsok Tseten](http://github.ubc.ca/ptseten)


## Introduction

Accidents can happen anytime, so having a car insurance is crucial but buying a car insurance can be a daunting task. The dire need of car insurance arises because nobody can predict when an accident might occur in the future. Buying a car insurance not only gives you peace of mind but it also shields you from any unfortunate incidents on the road.

The purpose of this analysis is to understand how marital status plays a role in influencing a person's decision to buy car insurance when they are cold called by a car insurance company. This will assist insurance providers when selecting the customer profile they want to reach in order to optimize their sales to call ratio.

## Analysis

In order to address and answer this question, we performed a hypothesis test on groups of people with different marital statuses, and calculated the different proportions of their acceptance of car insurance.

#### 1. Data set

This project works with the [Car Insurance Cold Calls data set, from Kaggle](https://www.kaggle.com/kondla/carinsurance#carInsurance_test.csv). It contains data about 4000 customers for a bank in the USA that received cold calls offering car insurance services. The dataset also includes the outcomes of said calls, i.e. if the customers acquired car insurance or not as a result of the call.

The data set can be loaded into R with the data_import.R script that is included in the [src folder](/src). The data set itself – carInsurance.csv – is stored in the [data folder](/data).

#### 2. Analysis

The purpose of this project is to carry out an exploratory analysis to identify if there is any relationship between a customer's marital status and their likelihood to acquire car insurance after receiving a cold call.

In order to answer the question, we perform a hypothesis test to assess if groups with different marital status show different proportions in their acceptance of the car insurance offered.

In the chosen data set, customers are classified as `married`, `single`, or `divorced`. Since we perform a two-group hypothesis test, as a first step in our analysis, we break down the customers into two groups, `married` and `not-married`, where the latter includes `single` and `divorced` individuals.

Thus, the null and alternative hypothesis are:

- **H0**: Acceptance rate of car insurance offers for married individuals is no different than the acceptance rate for non-married individuals.

- **HA**: Acceptance rate of car insurance offers for married individuals is different than the acceptance rate for non-married individuals.

To  report the results of our analysis we compute the acceptance rate of car insurance offers matching the null hypothesis and use a model of `H0` to generate a null hypothesis distribution. Then, by plotting the distributions for both groups, we can evaluate where the test statistics falls on the distributions and determine whether we can reject the null hypothesis. We chose our alpha, significance level, as 0.05.

To report the results of our analysis we compute the acceptance rate of car insurance offers matching the null hypothesis and use a model of `H0` to generate a null hypothesis distribution. Then, by plotting the distributions for both groups, we evaluate where the test statistics falls on the distribution and determine whether we can reject the null hypothesis.

#### 3. Conclusion

After performing the analysis we obtained a p-value of 0, and since it is less than the alpha – i.e p-value < 0.05 –, we reject the null hypothesis, concluding the result is statistically significant. In other words, the acceptance rate of car insurance offered for married individuals is different than the acceptance rate for non-married individuals as stated in HA.

The report can be accessed at [report/report.md](https://github.com/UBC-MDS/Car_Insurance_Analysis/blob/master/report/report.md)

## Steps to Run the Analysis

This project contains four mains steps including data cleaning, exploratory data analysis, statistical analysis (hypothesis test) and final report.

![](fig/Flowchart.png)

There are two ways to run the analysis:

#### Docker
1. Install [Docker](https://www.docker.com/get-started)
2. Clone or download this repository
3. Use the terminal to navigate to the root of this repo
4. To build the docker image run the following command:
```
docker build --tag car_insurance_analysis:1.0 .
```

5. (Optional) For a fresh start, type the following command:
```
docker run -e PASSWORD=test --rm -v <ABSOLUTE PATH OF REPO>:/home/rstudio/car_insurance_analysis car_insurance_analysis:1.0 make -C /home/rstudio/car_insurance_analysis clean
```

6. To run the analyses, use the following command in the terminal:
```
docker run -e PASSWORD=test --rm -v <ABSOLUTE PATH OF REPO>:/home/rstudio/car_insurance_analysis car_insurance_analysis:1.0 make -C /home/rstudio/car_insurance_analysis all
```

#### Without Docker
To run the data analysis pipeline without docker:
1. Clone or download this repository
2. Execute the following command in the terminal, at the root of the project

```
# (optional) for a fresh start
make clean

# to run the analyses
make all
```
The `Makefile` will run the following scripts:

**Step 1.** This script takes in the raw Car Insurance data and cleans it into a data set that fits our research question.
- Input: data/carInsurance
- Output: data/cleanedCarInsurance.csv
```
Rscript src/1_data_import.R data/carInsurance data/cleanedCarInsurance.csv
```

**Step 2.** This script reads the output from the first script and creates an exploratory visualization.
- Input: data/cleanedCarInsurance.csv
- Output: results/visualization.png
```
Rscript src/2_exploratory_visualization.R data/cleanedCarInsurance.csv results/visualization.png
```

**Step 3.** This script reads the output from the first script, performs a hypothesis test and output results in a summary table and generate a null hypothesis distribution visualization.
- Input: data/cleanedCarInsurance.csv
- Output: results/summarized_hypothesis_test.csv, results/alpha_h0_plot.png
```
Rscript src/3_hypothesis_test.R data/cleanedCarInsurance.csv results/summarized_hypothesis_test.csv results/alpha_h0_plot.png
```


Regardless of the method used, the report will be rendered into a .md document in the [report.md](https://github.com/UBC-MDS/Car_Insurance_Analysis/blob/master/report/report.md)

## Dependencies

R packages:

- ggplot2 3.0.0
- tidyverse 1.2.1
- infer 0.3.1
- broom 0.5.0


## Releases
 - [V1.0](https://github.com/UBC-MDS/Car_Insurance_Analysis/releases/tag/v1.0) Proposal
 - [V2.0.2](https://github.com/UBC-MDS/Car_Insurance_Analysis/releases/tag/v2.0.2) Milestone 1
 - [V3.0](https://github.com/UBC-MDS/Car_Insurance_Analysis/releases/tag/v3.0) Milestone 2
 - [V4.0](https://github.com/UBC-MDS/Car_Insurance_Analysis/releases/tag/v4.0) Final Project
