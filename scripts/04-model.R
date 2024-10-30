#### Preamble ####
# Purpose: We will use bayesian forecasting with 
# monte carlo simulation to model the 2024 elction. 
# Author: Tara Chakkithara
# Date: October 29 2024
# Contact: tara.chakkithara@icloud.com
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

# phase 1. we can generate the KDEs of pct for each swing state. 
generate_state_kde <- function(data, state){
  filtered_data <- data |>
    filter(swing_state == state)
  kde <- density(filtered_data$pct)
  kde_data <- data.frame(x = kde$x, y = kde$y)
  return(kde_data)
}

# phase 2. we can simulate a pct value for each state. 
simulate <- function(data, state) {
  kde_data <- generate_state_kde(data, state)
  random_sample <- sample(kde_data$x, size = 1, prob = kde_data$y,
                          replace = TRUE)
  
  return(random_sample/100)
}

# phase 3. we can allocate seats per swing state.
add_seats <- function(data, state, seats) {
  prob_win <- simulate(data, state)
  # here we use pct to generate a win or a loss. 
  outcome <- rbinom(1, 1, prob_win)
  return(seats * outcome)
}

# phase 4. we can simulate a single election.
simulate_election <- function(data) {
  # we initially assign trump all the red states and randomly allocate 
  # seats based on pct scores. 
  seats <- 219
  seats <- seats + add_seats(data, "Arizona", 11)
  seats <- seats + add_seats(data, "Nevada", 6)
  seats <- seats + add_seats(data, "Wisconsin", 10)
  seats <- seats + add_seats(data, "Michigan", 15)
  seats <- seats + add_seats(data, "Pennsylvania", 19)
  seats <- seats + add_seats(data, "North Carolina", 16)
  seats <- seats + add_seats(data, "Georgia", 16)
  return(seats / 538)
}

# phase 5. we can simulate an election multiple times. 
monte_carlo_simulation <- function(data, num_simulations) {
  results <- numeric(num_simulations)
  
  for(i in 1:num_simulations) {
    results[i] <- simulate_election(data)
  }
  
  return(results)
}

# phase 6. using all simulations we can update our beta prior. 
update_beta_prior <- function(prior_alpha, prior_beta, data, num_simulations){
  total_simulations <- monte_carlo_simulation(data, num_simulations)
  wins <- sum(total_simulations > 0.50)
  losses <- length(total_simulations) - wins
  
  updated_alpha <- prior_alpha + wins
  updated_beta <- prior_beta + losses
  
  x <- seq(0, 1, length.out = 100)
  prior_density <- dbeta(x, prior_alpha, prior_beta)
  updated_density <- dbeta(x, updated_alpha, updated_beta)
  
  plot_data <- data.frame(
    x = rep(x, 2),
    density = c(prior_density, updated_density),
    type = rep(c("Prior", "Updated"), each = length(x))
  )
  
  ggplot(plot_data, aes(x = x, y = density, color = type)) +
    geom_line(size = 1) +
    labs(title = "Prior and Updated Beta Distributions",
         x = "Probability of Winning",
         y = "Density") +
    theme_minimal() +
    scale_color_manual(values = c("blue", "red")) +
    theme(legend.title = element_blank())
}


