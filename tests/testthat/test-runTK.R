test_that("TK model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runTK(c(0,1,2,3), c(0,1,2,2), 5)
  test = c(0.0000000, 0.8013464, 1.7953129, 1.9984436)

  expect_equal(run$TK ,test, tolerance = 1e-6)
})

test_that("TK model MCMC", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runTK_MCMC(c(0,1,2,3), c(0,1,2,2), c(0.5,5))
  TK = sapply(1:2, function(i) run$TK[i])
  test = matrix(c(0.0000000, 0.0000000,
                  0.2130613, 0.8013464,
                  0.7358143, 1.7953129,
                  1.2319730, 1.9984436 ), byrow = TRUE, ncol = 2)

  expect_equal(TK ,test, tolerance = 1e-6)
})
