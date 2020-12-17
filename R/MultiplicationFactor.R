#' Function to compute the optimal multiplication factor for SD model
#' with binary search using distribution of parameters
#'
#' @param time vector of time
#' @param conc vector of concentration
#' @param model model type SD or IT
#' @param parms list of parameters
#' @param X percentage of reduction of survival
#' @param time_MFx time at which Mulitplication Factor has to be evaluated
#' @param MFx_range range of Multiplication factor to investigate
#' @param accuracy accuracy for the binary search algorithm
#' @param threshold_iter maximum number of iteration
#' @param quiet If \code{TRUE}, remove log information
#'
#' @importFrom stats median
#'
#' @export
#'
runMFx <- function(time,
                   conc,
                   model = NULL,
                   parms, # list with parameters kd, hb, z and kk
                   X = 50,
                   time_MFx,
                   MFx_range = c(0, 1e3),
                   accuracy = 0.01,
                   threshold_iter = 100,
                   quiet = FALSE){
  # Initialize
  if(model == "SD"){
    MF_run <- runSD_MCMC(time, conc, parms$kd, parms$hb, parms$z, parms$kk)
  }
  if(model == "IT"){
    MF_run <- runIT_MCMC(time, conc, parms$kd, parms$hb, parms$alpha, parms$beta)
  }
  TD_run = sapply(1:length(parms$kd), function(i) MF_run$TD[i])
  # compute median at time MFX
  survRate_initial <- median(TD_run[time == time_MFx,])
  survRate_objective <- (100 - X) / 100 * survRate_initial

  survRate_test <- survRate_initial

  MFx <- 1
  iter <- 0
  MFx_min <- min(MFx_range)
  MFx_max <- max(MFx_range)
  MFx_test <- max(MFx_range)

  survRate_sequence <- survRate_test
  MFx_sequence <- MFx_test

  while(abs(survRate_objective - survRate_test) > accuracy){

    # returned variables------------------------------------
    iter <- iter + 1
    MFx <- MFx_test
    MFx_sequence <- c(MFx_sequence, MFx_test)
    survRate_sequence <- c(survRate_sequence, survRate_test)
    # -------------------------------------------------------

    if(quiet == FALSE){
      print(paste("iter:", iter, "accuracy", abs(survRate_objective - survRate_test)))
    }
    conc_predict = conc * MFx_test
    if(model == "SD"){
      MF_run <- runSD_MCMC(time, conc_predict, parms$kd, parms$hb, parms$z, parms$kk)
    }
    if(model == "IT"){
      MF_run <- runIT_MCMC(time, conc_predict, parms$kd, parms$hb, parms$alpha, parms$beta)
    }

    TD_run = sapply(1:length(parms$kd), function(i) MF_run$TD[i])
    # compute median at time MFX
    survRate_test <- median(TD_run[time == time_MFx,])

    message <- NULL
    if((survRate_objective - survRate_test < 0) & (iter == 1)) {
      message <- "MFX is greater than 1000."
      break()
    }

    if(survRate_objective - survRate_test < 0) {
      MFx_min <- MFx_test
      MFx_test <- MFx_test + (MFx_max - MFx_min) / 2
    } else {
      if(survRate_objective - survRate_test > 0) {
        MFx_max <- MFx_test
        MFx_test <- MFx_test - (MFx_max - MFx_min) / 2
      }
    }

    if(MFx_test == max(MFx_range)){
      survRate_test <- NULL
      message_stopWhile <- paste("The multiplication factor is over the bound of 1000.")
      message_survrate_maxMFx <- paste("The survival rate at", max(MFx_range), "is", survRate_test, ".")
      break()
    }

    if(iter > threshold_iter) {
      survRate_test <- NULL
      message_stopWhile <- "The number of iteration reachs the threshold number of iteration."
      break()
    }

  }

  return(list(MFx = MFx,
              MFx_sequence = MFx_sequence,
              survRate_sequence = survRate_sequence,
              run = MF_run))
}
