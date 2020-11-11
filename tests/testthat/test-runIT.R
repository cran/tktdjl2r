test_that("test IT model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runIT(c(0,1,2,3), c(0,1,2,2), 0.5,0.2,4,0.5)
  test = data.frame(
    time = c(0,1,2,3),
    exposure = c(0,1,2,2),
    TK = c(0.0000000, 0.2130613, 0.7358143, 1.2319730),
    TD = c(1.0000000, 0.6652060, 0.4691168, 0.3529400)
  )
  expect_equal(run ,test, tolerance = 1e-6)
})
