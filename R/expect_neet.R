#' Test for non-empty thing of expected type
#'
#' @param thing_to_test An object to test, such as a numeric, character, list,
#' etc.
#' @param expected_type Expected output of `class(thing_to_test)`.
#'
#' A *neet test* tests for **non-empty** thing of **expected type**. This
#' is what is referred to as a *boundary condition* test in RStudio's primers
#' (todo: citation).
#'
#' These expectations are intended to integrate into minimal testing workflow
#' *for development* of data analyses. When developing a function, we will change parameters,
#' and structure of the pipeline. These tests
#' enable the developer to feel reassured the pipeline's functions are
#' outputting non-empty thing of expected type, while the developer decides on
#' the best structure for an analysis pipeline.
#'
#' A `character` string will be checked for being of string-length > 1.
#'
#' A `numeric` is checked for not being `NA`, `NULL`, `Inf`, or `-Inf`.
#'
#' A `list`` is checked for being of length > 1.
#'
#' A `data.frame` is checked for having at least one row.
#'
#' A `ggplot` object is checked for successfully running.
#'
#' @import testthat
#'
#' @export

expect_neet <- function(thing_to_test, expected_type) {
  # we expect non-empty
  expect_nonempty(thing_to_test)
  # thing of expected type
  expect_is(thing_to_test, expected_type)
}

#' @export

# generic function
expect_nonempty <- function(thing_to_test) {
  UseMethod("expect_nonempty")
}

#' @export

# default neet
expect_nonempty.default <-
  function(thing_to_test) {
    "no neet test for this object"
  }

#' @export

expect_nonempty.data.frame <-
  function(thing_to_test) {
    expect_gt(thing_to_test %>% nrow(), 0)
  }

#' @export

expect_nonempty.numeric <-
  function(thing_to_test, positive_only = FALSE) {

    # test to see if na
    expect_false(any(is.na(thing_to_test)))
    expect_false(is.null(thing_to_test))

    # infs
    expect_false(
      any(abs(as.numeric(thing_to_test)) == Inf))

    # non-empty
    expect_true(length(thing_to_test) > 0)
  }

#' @export

expect_nonempty.list <- function(thing_to_test){
  expect_gt(thing_to_test %>% length(), 0)
}

#' @export

expect_nonempty.character <- function(thing_to_test){
  expect_gt(thing_to_test %>% stringr::str_length(), 0)
}

#' @export

expect_nonempty.rma <- function(thing_to_test) {
  expect_is(thing_to_test, "rma")
}

#' @export

expect_nonempty.ggplot <- function(thing_to_test) {
  TRUE
}
