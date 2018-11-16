# DSCI_522_Car_Insurance_Analysis

### 1. Data set

This project works with the [Car Insurance Cold Calls data set, from Kaggle](https://www.kaggle.com/kondla/carinsurance#carInsurance_test.csv). It contains data about 4000 customers for a bank in the USA that received cold calls offering car insurance services. The dataset also includes the outcomes of said calls, i.e. if the customers acquired car insurance or not as a result of the call. 

The data set can be loaded into R with the data_import.R script that is included in the [src folder](/src). The data set itself – carInsurance.csv – is stored in the [data folder](/data).

### 2. Exploratory Analysis

The purpose of this project is to carry out an exploratory analysis to identify if there is any relationship between a customer's marital status and their likelihood to acquire car insurance after receiving a cold call.

### 3. Analysis Plan

In order to answer the question formulated in the previous section, we will perform a hypothesis test to assess if groups with different marital status show different proportions in their acceptance of the car insurance offered.

In the chosen data set, customers are classified as `married`, `single`, or `divorced`. Since we will perform a two-group hypothesis test, as a first step in our analysis, we will break down the customers into two groups, `married` and `not-married`, where the latter includes `single` and `divorced` individuals.

Thus, the null and alternative hypothesis are:

$H_0$: Acceptance rate of car insurance offers for married individuals is no different than the acceptance rate for non-married individuals.

$H_A$: Acceptance rate of car insurance offers for married individuals is different than the acceptance rate for non-married individuals.

### 4. Reporting

To report the results of our analysis we will compute the acceptance rate of car insurance offers matching the null hypothesis and use a model of $H_0$ to generate a null hypothesis distribution. Then, by plotting the distributions for both groups, we can evaluate where the test statistics falls on the distributions and determine whether we can reject the null hypothesis.