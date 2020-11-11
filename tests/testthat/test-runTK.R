test_that("TK model", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  run = runTK(c(0,1,2,3), c(0,1,2,2), 5)
  test = data.frame(
    time = c(0,1,2,3),
    exposure = c(0,1,2,2),
    TK = c(0,0.8013464, 1.7953129, 1.9984436)
  )
  expect_equal(run ,test, tolerance = 1e-6)
})
