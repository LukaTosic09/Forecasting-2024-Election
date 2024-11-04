# The Coin Flip Effect
# How Swing States Transform Elections Into Games of Chance

## Abstract
This paper uses the poll of polls method to develop a bayesian hierarchical model to forecast the outcome of the 2024 U.S. election. Based on polling data collected from July 21 to October 19, 2024, our analysis indicates that Kamala Harris is the candidate most likely to win the election. Given the complexities of the electoral college voting system and significant political polarization within the U.S, election outcomes appear very close this year. This paper aims to provide deeper insights into voter behaviour.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from FiveThirtyEight on October 17th
-   `data/analysis_data` contains the cleaned dataset that was constructed for analysis
-   `model` contains the fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of the auto-complete tool, Codriver. The abstract and introduction were written with the help of ChatHorse and the entire chat history is available in inputs/llms/usage.txt.

## Some checks

- [ ] Change the rproj file name so that it's not starter_folder.Rproj
- [ ] Change the README title so that it's not Starter folder
- [ ] Remove files that you're not using
- [ ] Update comments in R scripts
- [ ] Remove this checklist
