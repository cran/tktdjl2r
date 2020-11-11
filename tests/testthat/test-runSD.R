test_that("test SD model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runSD(c(0,1,2,3), c(0,1,2,2), 0.5,0.2,0.2,4)
  test = data.frame(
    time = c(0,1,2,3),
    exposure = c(0,1,2,2),
    TK = c(0.0000000, 0.2130612, 0.7353614, 1.2328876),
    TD = c(0.0000000, 0.1991918, 2.8929098, 149.8599819)
  )
  expect_equal(run ,test, tolerance = 1e-6)
})
