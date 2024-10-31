#### Preamble ####
# Purpose: Simulates the analysis data we will be using in our analysis
# Author: Tara Chakkithara
# Date: 30 October 2024
# Contact: tara.chakkithara@icloud.com
# License: MIT


#### Required Packages ####
library(tidyverse)

# simulate data.
# we want to look at 2 variables : swing state and pct for Donald Trump


swing_states <- c("Pennsylvania", "Nevada", "North Carolina", "Wisconsin",
                  "Michigan", "Georgia", "Arizona")

num_samples <- 1000 
data <- data.frame(
  swing_state = rep(swing_states, each = num_samples),
  pct = c(
    rnorm(num_samples, mean = 50, sd = 5),   
    rnorm(num_samples, mean = 50, sd = 5),  
    rnorm(num_samples, mean = 50, sd = 5),  
    rnorm(num_samples, mean = 50, sd = 5),  
    rnorm(num_samples, mean = 50, sd = 5),  
    rnorm(num_samples, mean = 50, sd = 5),  
    rnorm(num_samples, mean = 50, sd = 5)
  )
)

data$pct <- pmin(pmax(data$pct, 0), 100)

write_csv(data, './data/simulated_data/simulated_data.csv')