test_that("low wind factor", {
  expect_equal(wind_factor(10, 3), 13)
})

test_that("high wind factor", {
  expect_equal(wind_factor(30, 60), 80)
})
