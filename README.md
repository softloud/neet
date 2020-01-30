
<!-- README.md is generated from README.Rmd. Please edit that file -->

# interested in co-authoring?

# neet

<!-- badges: start -->

<!-- badges: end -->

Test for non-empty thing of expected type

A *neet test* tests for **non-empty** thing of **expected type**. This
is what is referred to as a *boundary condition* test in RStudio’s
primers (todo: citation).

These expectations are intended to integrate into minimal testing
workflow *for development* of data analyses. When developing a function,
we will nge parameters, and structure of the pipeline. These tests
enable the developer to feel reassured the pipeline’s functions are
outputting non-empty thing of expected type, while the developer decides
the best structure for an analysis pipeline.

A `character` string will be checked for being of string-length \> 1.

A `numeric` is checked for not being `NA`, `NULL`, `Inf`, or `-Inf`.

A \`list\`\` is checked for being of length \> 1.

A `data.frame` is checked for having at least one row.

A `ggplot` object is checked for successfully running.

# Installation

You can install the released version of neet from GitHub with:

``` r
# install devtools
install.packages(devtools) 

# use devtools to install package from github
devtools::install_github("softloud/neet")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(neet)
## basic example code

expect_neet(3, "numeric") # test numeric
expect_neet("cat", "character") # test character string
expect_neet(mtcars, "data.frame") # test data frame

 
```
