context("assert neet")

test_that("neet numeric", {
  expect_true(assert_neet(3, "numeric"))
  expect_error(assert_neet(3, "character"))
})

test_that("neet character", {
  expect_true(assert_neet("cat", "character"))
  expect_error(assert_neet("cat", "numeric"))
})

test_that("neet logical", {
  expect_true(assert_neet(TRUE, "logical"))
  expect_error(assert_neet(TRUE, "numeric"))
})

test_that("neet dataframe", {
  expect_true(assert_neet(mtcars, "data.frame"))
  expect_error(assert_neet(mtcars, "numeric"))
})

test_that("neet list", {
  a_list <- list(a = c(3,4), b = "cat", c = mtcars)
  expect_true(assert_neet(a_list, "list"))
  expect_error(assert_neet(a_list, "numeric"))
})
