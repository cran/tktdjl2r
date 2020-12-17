test_that("test IT model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runIT(c(0,1,2,3), c(0,1,2,2), 0.5,0.2,0.2,4)
  test = list(
    TK = c(0.0000000, 0.2130613, 0.7358143, 1.2319730),
    TD = c(1.0000000000, 0.3578450456, 0.0036388589, 0.0003809228)
  )
  expect_equal(run$TK ,test$TK, tolerance = 1e-6)
  expect_equal(run$TD ,test$TD, tolerance = 1e-6)
})


test_that("test IT MCMC model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runIT_MCMC(c(0,1,2,3), c(0,1,2,2), # time and conc
                   c(0.5,0.2),c(0.2,0.3),c(12,4), c(0.1,2) # MCMC
  )

  TK = sapply(1:2, function(i) run$TK[i])
  TD = sapply(1:2, function(i) run$TD[i])
  test = list(
    TK = matrix(c(0.0000000, 0.00000000,
                  0.2130613, 0.09365374,
                  0.7358143, 0.35020152,
                  1.2319730, 0.64896111 ), byrow = TRUE, ncol = 2),

    TD = matrix(c(1.0000000, 1.0000000,
                  0.4907752, 0.7404123,
                  0.3816416, 0.5446370,
                  0.3055030, 0.39614247 ), byrow = TRUE, ncol = 2)
  )
  expect_equal(TK ,test$TK, tolerance = 1e-6)
  expect_equal(TD ,test$TD, tolerance = 1e-6)
})
