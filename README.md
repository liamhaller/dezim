
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dezim

<!-- badges: start -->
<!-- badges: end -->

The goal of dezim is to …

## Installation

You can install the development version of dezim from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("liamhaller/dezim")
```

## Example

Add \`+ dezim_style() to ggplot2 graphs for DeZIM formatting

``` r
library(dezim)
library(ggplot2)

mtcars$gear <- as.factor(mtcars$gear)

p1 <- ggplot(mtcars) +
geom_point(aes(x = wt, y = mpg, colour = gear)) +
labs(
title = "Fuel economy declines as weight increases",
  x = "Weight (1000 lbs)",
  y = "Fuel economy (mpg)",
  colour = "Gears"
  )

# Default Graph
  p1
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

#with DeZIM formatting
  p1 +
  dezim_style()
```

<img src="man/figures/README-example-2.png" width="100%" />

``` r

#use dezim_colors for functions that require color/fill
 p1 +
 dezim_style() +
 scale_color_manual(values = dezim_colors)
```

<img src="man/figures/README-example-3.png" width="100%" />
