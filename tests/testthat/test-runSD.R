test_that("test SD model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runSD(c(0,1,2,3), c(0,1,2,2), 0.5,0.2,0.2,4)
  test = list(
    TK = c(0.0000000, 0.2130612 , 0.7343620, 1.2326448),
    TD = c(1.000000000, 0.819579885, 0.242370628, 0.007957369)
  )
  expect_equal(run$TK ,test$TK, tolerance = 1e-6)
  expect_equal(run$TD ,test$TD, tolerance = 1e-6)
})


test_that("test SD MCMC model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runSD_MCMC(c(0,1,2,3), c(0,1,2,2), # time and conc
                   c(0.5,0.2),c(0.2,0.3),c(12,4), c(0.1,2) # MCMC
                   )

  TK = sapply(1:2, function(i) run$TK[i])
  TD = sapply(1:2, function(i) run$TD[i])
  test = list(
    TK = matrix(c(0.0000000, 0.00000000,
                  0.2130612, 0.09365374,
                  0.7356560, 0.35163458,
                  1.2340057, 0.64913410 ), byrow = TRUE, ncol = 2),

    TD = matrix(c(1.0000000, 1.0000000,
                  0.8187308, 0.7408182,
                  0.6703200, 0.5488116,
                   0.5488116, 0.4065697 ), byrow = TRUE, ncol = 2)
  )
  expect_equal(TK ,test$TK, tolerance = 1e-6)
  expect_equal(TD ,test$TD, tolerance = 1e-6)
})
