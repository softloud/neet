context("expect neet")

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
