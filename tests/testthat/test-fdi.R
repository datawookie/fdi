test_that("low FDI", {
  expect_equal(fdi(10, 50, 10, 1, 20), 7)
})

test_that("high FDI", {
  expect_equal(fdi(40, 30, 30, 15, 5), 81)
})
