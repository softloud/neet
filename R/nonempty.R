#' Expect non-empty thing
#'
#' Test if an R object is empty.
#'
#' @param thing_to_test An R object.
#'

#' @export

# generic function
expect_nonempty <- function(thing_to_test) {
  UseMethod("expect_nonempty")
}

# default -----------------------------------------------------------------

#' @export

# default neet
expect_nonempty.default <-
  function(thing_to_test) {
    "no neet test for this object"
  }


# data.frame --------------------------------------------------------------

#' @export

expect_nonempty.data.frame <-
  function(thing_to_test) {
    testthat::expect_gt(thing_to_test %>% nrow(), 0)
  }

#' @export

expect_nonempty.numeric <-
  function(thing_to_test) {

    # test to see if na
    testthat::expect_false(any(is.na(thing_to_test)))
    testthat::expect_false(is.null(thing_to_test))

    # infs
    testthat::expect_false(
      any(abs(as.numeric(thing_to_test)) == Inf))

    # non-empty
    testthat::expect_true(length(thing_to_test) > 0)
  }

#' @export

expect_nonempty.list <- function(thing_to_test){
  testthat::expect_gt(thing_to_test %>% length(), 0)
}

#' @export

expect_nonempty.integer <- function(thing_to_test){
  testthat::expect_gt(thing_to_test %>% length(), 0)
}

#' @export

expect_nonempty.character <- function(thing_to_test){
  testthat::expect_gt(thing_to_test %>% stringr::str_length(), 0)
}

#' @export

expect_nonempty.rma <- function(thing_to_test) {
  testthat::expect_is(thing_to_test, "rma")
}


