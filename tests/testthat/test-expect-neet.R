context("expect neet")

test_that("test wrapper works", {
  expect_success(test_neet(3, "numeric"))
})

test_that("neet numeric", {
  expect_success(expect_neet(3, "numeric"))
  expect_error(expect_neet(3, "character"))
})

test_that("neet character", {
  expect_success(expect_neet("cat", "character"))
  expect_error(expect_neet("cat", "numeric"))
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
