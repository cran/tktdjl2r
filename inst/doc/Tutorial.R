## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE--------------------------------------------------------
#  library(tktdjl2r)

## ----setup_tktdjl2r, eval=FALSE-----------------------------------------------
#  # Julia can be quite long to install the first time.
#  tktdjl2r::tktdjl2r_setup()

## ----runTK, eval=FALSE--------------------------------------------------------
#  single_runTK = runTK(c(0,1,2,3), c(0,1,2,2), 0.5)

## ----runTK_MCMC, eval=FALSE---------------------------------------------------
#  kdVector = rbeta(4,10,10)
#  
#  mcmc_runTK = runTK_MCMC(c(0,1,2,3), c(0,1,2,2), kdVector)

## ----runSD, eval=FALSE--------------------------------------------------------
#  single_runSD = runSD(c(0,1,2,3), c(0,1,2,2), 0.5, 0.2, 1, 0.4)

## ----runSD_MCMC, eval=FALSE---------------------------------------------------
#  paramDF = data.frame(
#    kd = rbeta(4,10,10),
#    hb = rbeta(4,10,10),
#    z = rbeta(4,10,10),
#    kk = rbeta(4,10,10))
#  mcmc_runSD = runSD_MCMC(c(0,1,2,3), c(0,1,2,2), paramDF$kd, paramDF$hb, paramDF$z, paramDF$kk)

## ----runIT, eval=FALSE--------------------------------------------------------
#  single_runIT = runIT(c(0,1,2,3), c(0,1,2,2),0.5, 0.2, 1, 0.4)

## ----runIT_MCMC, eval=FALSE---------------------------------------------------
#  paramDF = data.frame(
#    kd = rbeta(4,10,10),
#    hb = rbeta(4,10,10),
#    alpha = rbeta(4,10,10),
#    beta = rbeta(4,10,10))
#  mcmc_runIT = runIT_MCMC(c(0,1,2,3), c(0,1,2,2), paramDF$kd, paramDF$hb, paramDF$alpha, paramDF$beta)

## ----deSolveTK, eval=FALSE----------------------------------------------------
#  library(deSolve)
#  
#  model_TK <- function(t, State, parms, input) {
#    with(as.list(c(parms, State)), {
#      list(kd*(input(t) - State))    # internal damage
#    })
#  }
#  
#  deSolve_TK <- function(time, conc, listParameters){
#    signal <- data.frame(times = time,
#                         import = conc)
#  
#    sigimp <- stats::approxfun(signal$times,
#                               signal$import,
#                               method = "linear",
#                               rule = 2)
#  
#    ## values for steady state
#    xstart <- c(D = 0)
#    ## model
#    out <- ode(y = xstart,
#               times = time,
#               func = model_TK,
#               parms = listParameters,
#               input = sigimp)
#  
#    data.frame(
#      time = time,
#      exposure = conc,
#      TK = out[,2]
#    )
#  
#  }

## ----plotTK, eval=FALSE-------------------------------------------------------
#  listParameters = list(kd = 0.5)
#  testR_runTK = deSolve_TK(c(0,1,2,3), c(0,1,2,2), list(kd=0.5))
#  plot(c(0,1,2,3), single_runTK$TK, type = "l", lwd = 3)
#  lines(c(0,1,2,3), testR_runTK$TK, col = "red", lwd = 2)

## ----speedTK, eval=FALSE------------------------------------------------------
#  library(microbenchmark)
#  
#  microbenchmark::microbenchmark(
#    testJulia_runTK = runTK(c(0,1,2,3), c(0,1,2,2), 0.5),
#    testR_runTK = deSolve_TK(c(0,1,2,3), c(0,1,2,2), list(kd=0.5)),
#    times = 10
#  )

