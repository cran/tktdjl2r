test_that("Multiplication Factor model SD", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  time = c(0,1,2,3,4,5,6)
  conc =  c(0,1,2,2,2,3,4)
  data("list_paramSD_PRZcst")
  parms = list(
    kd = list_paramSD_PRZcst$kd[1:100],
    hb = list_paramSD_PRZcst$hb[1:100],
    z = list_paramSD_PRZcst$z[1:100],
    kk = list_paramSD_PRZcst$kk[1:100]
  )
  X = 50
  time_MFx = time[length(time)]
  MFx_range = c(0, 1e3)
  accuracy = 0.01
  threshold_iter = 100

  MFX_SD = runMFx(time, conc, "SD", parms, X, time_MFx, MFx_range, accuracy, threshold_iter)
  TD_computed = sapply(1:length(parms$kd), function(i) MFX_SD$run$TD[i])
  (computed = median(TD_computed[time == time_MFx,]))

  MF_1 = runSD_MCMC(time, conc, parms$kd, parms$hb, parms$z, parms$kk)
  TD_1 = sapply(1:length(parms$kd), function(i) MF_1$TD[i])
  (target = (100 - X) / 100 * median(TD_1[time == time_MFx,]))

  MF_target = runSD_MCMC(time, conc *MFX_SD$MFx, parms$kd, parms$hb, parms$z, parms$kk)
  TD_target = sapply(1:length(parms$kd), function(i) MF_target$TD[i])
  (obtained = median(TD_target[time == time_MFx,]))

  # TEST:
  expect_true(abs(target - obtained) < accuracy)

})


test_that("Multiplication Factor model IT", {

  skip_on_cran()
  julia <- tktdjl2r::tktdjl2r_setup()

  time = c(0,1,2,3,4,5,6)
  conc =  c(0,1,2,2,2,3,4)
  data("list_paramIT_PRZcst")
  parms = list(
    kd = list_paramIT_PRZcst$kd[1:100],
    hb = list_paramIT_PRZcst$hb[1:100],
    alpha = list_paramIT_PRZcst$alpha[1:100],
    beta = list_paramIT_PRZcst$beta[1:100]
  )

  X = 50
  time_MFx = time[length(time)]
  MFx_range = c(0, 1e3)
  accuracy = 0.01
  threshold_iter = 100

  MFX_IT = runMFx(time, conc, "IT", parms, X, time_MFx, MFx_range, accuracy, threshold_iter)
  TD_computed = sapply(1:length(parms$kd), function(i) MFX_IT$run$TD[i])
  (computed = median(TD_computed[time == time_MFx,]))

  MF_1 = runIT_MCMC(time, conc, parms$kd, parms$hb, parms$alpha, parms$beta)
  TD_1 = sapply(1:length(parms$kd), function(i) MF_1$TD[i])
  (target = (100 - X) / 100 * median(TD_1[time == time_MFx,]))

  MF_target = runIT_MCMC(time, conc * MFX_IT$MFx, parms$kd, parms$hb, parms$alpha, parms$beta)
  TD_target = sapply(1:length(parms$kd), function(i) MF_target$TD[i])
  (obtained = median(TD_target[time == time_MFx,]))

  # TEST:
  expect_true(abs(target - obtained) < accuracy)

})
