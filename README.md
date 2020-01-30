
<!-- README.md is generated from README.Rmd. Please edit that file -->

# When is done *done*? Towards the fundamentals of automated testing for collaborative data analysis development

> interested in contributing to authorship? read on.

Hi there, friends at rstudio::conf.

I am writing a
[manuscript](https://github.com/softloud/neet/blob/master/analysis/when-is-done-done.Rmd)
about piano practice and automated tests for my doctorate. And, after a
delightful chat on twitter,

<blockquote class="twitter-tweet">

<p lang="en" dir="ltr">

This sounds very interesting\! I'd love to get involved. What's the best
Slack to reach you on?

</p>

— Emily Riederer @ \#rstudioconf (@EmilyRiederer)
<a href="https://twitter.com/EmilyRiederer/status/1222914433980211203?ref_src=twsrc%5Etfw">January
30, 2020</a>

</blockquote>

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

it occurs to me what with rstudio::conf on and all, I might be able to
mine some of the finest minds in reproducible computing for data
analysis in R.

The objective of this paper is to provide a *toolchain walkthrough* for
a test-driven research data analyses. I have some of analyses to
complete for the doctorate, but it can feel overwhelming as to where to
start and where it will end, with reproducible computing.

I also see the same patterns play out in Reproducibility Team for [The
repliCATS Project](https://replicats.research.unimelb.edu.au/) where I
am research assisting while I complete my phd. How do we collaborate and
communitcate with each other in a way that reduces anxiety, makes us
feel we are on the same page? How do we feel *safe* to share code? I
think test-driven development is a key component of the *collaborative*
nature of research software engineering.

This is largely drawn from Greg Wilson’s primers, R Packages, and,
hopefully, some practicing researchers who implement automated tests at
rstudo::conf. This manuscript is intended to be a roadmap to completion
of research software engineering projects for myself and my team.

By stating what we intend our function to do, and how we test it, we
provide a transparency that helps others catch inadvertent *questionable
research practices* to which we all fall prey.

I have created some [issues](https://github.com/softloud/neet/issues)
with questions about workflow and *doneness*. You can also hit me up on
r-ladies slack or the openevisynth slack (hit me up for an invite).

Me, I would describe myself as an automated testing beginner. Something
that I have been playing around with is boundary tests for
in-development analyses. I’d be interested to hear from people who have
written more complex tests.

I will list everyone who contributes as an author on the paper, if they
wish to acknowledged as such. I do not profess to be the all-knowing
expert of testing, I do not have the experience.

Best, Charles

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
