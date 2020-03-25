context("expect neet")

library(neet)

test_that("neet numeric", {
  expect_success(expect_neet(3, "numeric"))
  expect_error(expect_neet(3, "character"))
  expect_error(expect_neet(NULL, "numeric"))
  expect_error(expectg_neet(NA, "numeric"))
})

test_that("neet character", {
  expect_success(expect_neet("cat", "character"))
  expect_error(expect_neet("cat", "numeric"))
  expect_error(expect_neet(NULL, "character"))
})

test_that("neet logical", {
  expect_success(expect_neet(TRUE, "logical"))
  expect_error(expect_neet(TRUE, "numeric"))
})

test_that("neet dataframe", {
  expect_success(expect_neet(mtcars, "data.frame"))
  expect_error(expect_neet(mtcars, "numeric"))
})

test_that("neet list", {
  a_list <- list(a = c(3,4), b = "cat", c = mtcars)
  expect_success(expect_neet(a_list, "list"))
  expect_error(expect_neet(a_list, "numeric"))
})
