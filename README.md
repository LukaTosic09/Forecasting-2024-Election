# 2024 US Presidential Election Forecasting 

## Overview

This repository contains the paper "The Coin Flip Effect: How Swing States Create Election Outcomes That Resemble The Likelihood of a Coin Flip" as well as the code and data used to create it. The paper was created by Sakura Hu, Luka Tosic, and Tara Chikkathara. The paper forecasts the winner of the 2024 US election by utilizing the Poll of Polls method and analyzing the outcome of a Bayesian Hierarchical model using FiveThirtyEight's October 17th, 2024 US Election Polling Data (current cycle)


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from FiveThirtyEight on October 17th
-   `data/analysis_data` contains the cleaned dataset that was constructed for analysis
-   `model` contains the fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the LLM ChatGPT. [] were written with the help of ChatGPT and the entire chat history is available in inputs/llms/usage.txt.

