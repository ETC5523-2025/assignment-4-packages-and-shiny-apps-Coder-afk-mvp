
# NamesR

<!-- badges: start -->
<!-- badges: end -->

The goal of **NamesR** is to explore and visualize the most common first names in the United States (2013).  
This package includes:
- A clean data-set of popular names and their frequency per 1,000 Americans.  
- An interactive Shiny app for visual exploration.
- Full documentation and vignettes generated using **roxygen2** and **pkgdown**.

## Overview

- The common_names dataset offers a hands-on playground for practising data manipulation and visualization in R.

- Discover gender trends, frequency distributions, and ranking patterns using tidyverse tools or through the interactive app.

## Installation

You can install the development version of NamesR from [GitHub](https://github.com/ETC5523-2025/assignment-4-packages-and-shiny-apps-Coder-afk-mvp) with:

``` r
# install.packages("pak")
pak::pak("ETC5523-2025/assignment-4-packages-and-shiny-apps-Coder-afk-mvp")
```

## Documentation

For detailed documentation and examples, visit the pkgdown site:  
[https://etc5523-2025.github.io/assignment-4-packages-and-shiny-apps-Coder-afk-mvp/](https://etc5523-2025.github.io/assignment-4-packages-and-shiny-apps-Coder-afk-mvp/)

## Data Description

NamesR includes a dataset designed for easy exploration and visualization:

- common_names – Contains the 20 most common first names in the United States (2013), along with each name’s gender and frequency per 1,000 Americans.
Includes variables:

- name — First name

- gender — Gender classification ("Male" or "Female")

- per_1000 — Number of people per 1,000 Americans with that name

### What you can do

1. Explore naming trends by gender or frequency
2. Visualize top names with ggplot2
3. Filter and rank using tidyverse functions
4. Interactively explore names via the built-in Shiny app

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(NamesR)
## basic example code

1. Rank and compare
common_names |>
  group_by(gender) |>
  top_n(5, per_1000) |>
  arrange(gender, desc(per_1000))
  
2. Visualization practise
ggplot(common_names, aes(x = gender, y = per_1000, fill = gender)) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "Distribution of Name Frequency by Gender",
       x = "Gender", y = "Names per 1,000 Americans") +
  theme_minimal()

```

## Shiny App

``` r
NamesR::run_app()
```

## Want to help shape NamesR?

You can contribute by reporting issues, refining code or suggesting new ideas for the Shiny app and data-set. The source code 
is available by clicking the Github icon on the website.





