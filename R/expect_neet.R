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
#'
#' `assert_neet` tests the input is non-empty and of expected type, and
#' `expect_neet` is an expectation for [test_that] that checks the output is
#' non-empty and of expected type
#' `test_neet` is a test for [testthat]
#'
#' @family neet Test for non-empty thing of expected type.
#'
#' @export

expect_neet <- function(thing_to_test, expected_type) {
  # we expect non-empty
  expect_nonempty(thing_to_test)
  # thing of expected type
  testthat::expect_is(thing_to_test, expected_type)
}


#' Test for non-empty thing of expected type.
#'
#' @inheritParams expect_neet
#'
#' @family neet Test for non-empty thing of expected type.
#'
#' @export

test_neet <-
  function(thing_to_test,
           expected_type) {
    testthat::test_that("neet", {
      expect_neet(thing_to_test, expected_type)
    })
  }


#' Check input is non-empty and expected type
#'
#' @inheritParams expect_neet
#'
#' @family neet Test for non-empty thing of expected type.
#'
#' @export

assert_neet <- function(thing_to_test, expected_type) {
  # we expect non-empty
  assertthat::not_empty(thing_to_test)
  # thing of expected type
  assertthat::assert_that(
    expected_type %in% class(thing_to_test),
    msg = paste("thing_to_test not of expected type - ", expected_type)
  )
}
