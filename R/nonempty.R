#' Expect non-empty thing
#'
#' Test if an R object is empty.
#'
#' @param thing_to_test
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
