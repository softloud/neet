context("expect neet")

library(neet)
library(ggplot2)


test_that("neet numeric", {
  expect_success(expect_neet(3, "numeric"))
  expect_error(expect_neet(3, "character"))
  expect_error(expect_neet(NULL, "numeric"))
  expect_error(expectg_neet(NA, "numeric"))
  expect_success(expect_neet(3.12, "numeric"))
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

test_that("neet numint", {
  expect_success(expect_neet(3, "numint"))
  expect_success(expect_neet(3L, "numint"))
})

test_that("neet ggplot", {
  testplot <-
    mtcars %>%
    ggplot(aes(x = cyl, y = mpg)) +
    geom_point()

  expect_success(expect_neet(testplot, "ggplot"))
  expect_error(expect_neet(3, "ggplot"))
})
