# Forecasting the 2024 U.S. General Election

## Abstract
This paper forecasts the outcome of the 2024 U.S. general election. Using the
poll of polls approach, a bayesian hierarchical model was developed with data
from FiveThirtyEight using polling data from July 21 to October 19, 2024. The
model’s prediction is based on the electoral college vote in the seven key swing
states : Arizona, Nevada, Michigan, Georgia, Wisconsin, Pennsylvania, and North
Carolina to estimate the overall winner. Results indicate that Harris is predicted
to win with a probaility of 66%.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from FiveThirtyEight on October 17th
-   `data/analysis_data` contains the cleaned dataset that was constructed for analysis
-   `model` contains the fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage
No LLMs were used for this paper. 
