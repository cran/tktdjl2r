#' Single TK model
#'
#' @param time vector of time
#' @param conc vectopr of concentration
#' @param kd parameter of TK model
#'
#' @export
#'
runTK = function(time, conc, kd){
  class(time) <- "JuliaTuple"
  JuliaCall::julia_assign("time", time)
  class(conc) <- "JuliaTuple"
  JuliaCall::julia_assign("conc", conc)
  JuliaCall::julia_assign("kd", kd)
  jleval = stringr::str_interp("runTK(time, conc, kd)") # ne renvoie rien mais écrit dans Obj
  return(JuliaCall::julia_eval(jleval))
}


#' MCMC TK model
#'
#' @param time vector of time
#' @param conc vectopr of concentration
#' @param kd vector of parameter of TK model
#'
#' @export
#'
runTK_MCMC = function(time, conc, kd){
  class(time) <- "JuliaTuple"
  JuliaCall::julia_assign("time", time)
  class(conc) <- "JuliaTuple"
  JuliaCall::julia_assign("conc", conc)
  JuliaCall::julia_assign("kd", kd)
  jleval = stringr::str_interp("runTK_MCMC(time, conc, kd)") # ne renvoie rien mais écrit dans Obj
  return(JuliaCall::julia_eval(jleval))
}



#' Single SD model
#'
#'
#' @param time vector of time
#' @param conc vectopr of concentration
#' @param kd parameter of TK model
#' @param hb paramter background mortality model
#' @param z parameter threshold of SD model
#' @param kk parameter killing rate of SD model
#'
#' @export
#'
runSD = function(time, conc, kd, hb, z ,kk){
  class(time) <- "JuliaTuple"
  JuliaCall::julia_assign("time", time)
  class(conc) <- "JuliaTuple"
  JuliaCall::julia_assign("conc", conc)
  JuliaCall::julia_assign("kd", kd)
  JuliaCall::julia_assign("hb", hb)
  JuliaCall::julia_assign("z", z)
  JuliaCall::julia_assign("kk", kk)
  jleval = stringr::str_interp("runSD(time, conc, kd, hb, z, kk)") # ne renvoie rien mais écrit dans Obj
  return(JuliaCall::julia_eval(jleval))
}


#' MCMC SD model
#'
#'
#' @param time vector of time
#' @param conc vectopr of concentration
#' @param kd vector of parameter for TK model
#' @param hb vector of background mortality model
#' @param z vector of threshold of SD model
#' @param kk vector of killing rate of SD model
#'
#' @export
#'
runSD_MCMC = function(time, conc, kd, hb, z ,kk){
  class(time) <- "JuliaTuple"
  JuliaCall::julia_assign("time", time)
  class(conc) <- "JuliaTuple"
  JuliaCall::julia_assign("conc", conc)
  class(kd) <- "JuliaTuple"
  class(hb) <- "JuliaTuple"
  class(z) <- "JuliaTuple"
  class(kk) <- "JuliaTuple"
  JuliaCall::julia_assign("kd", kd)
  JuliaCall::julia_assign("hb", hb)
  JuliaCall::julia_assign("z", z)
  JuliaCall::julia_assign("kk", kk)
  jleval = stringr::str_interp("runSD_MCMC(time, conc, kd, hb, z, kk)") # ne renvoie rien mais écrit dans Obj
  return(JuliaCall::julia_eval(jleval))
}

#' Single IT model
#'
#' @param time vector of time
#' @param conc vector of concentration
#' @param kd parameter of TK model
#' @param hb paramter background mortality model
#' @param alpha parameter median of IT model
#' @param beta parameter shape of IT model
#'
#' @export
#'
runIT = function(time, conc, kd, hb, alpha, beta){
  class(time) <- "JuliaTuple"
  JuliaCall::julia_assign("time", time)
  class(conc) <- "JuliaTuple"
  JuliaCall::julia_assign("conc", conc)
  JuliaCall::julia_assign("kd", kd)
  JuliaCall::julia_assign("hb", hb)
  JuliaCall::julia_assign("alpha", alpha)
  JuliaCall::julia_assign("beta", beta)
  jleval = stringr::str_interp("runIT(time, conc, kd, hb, alpha, beta)") # ne renvoie rien mais écrit dans Obj
  return(JuliaCall::julia_eval(jleval))
}

#' MCMC IT model
#'
#' @param time vector of time
#' @param conc vector of concentration
#' @param kd vector of parameter of TK model
#' @param hb vector of background mortality model
#' @param alpha vector median of IT model
#' @param beta vector shape of IT model
#'
#' @export
#'
runIT_MCMC = function(time, conc, kd, hb, alpha, beta){
  class(time) <- "JuliaTuple"
  class(conc) <- "JuliaTuple"
  JuliaCall::julia_assign("time", time)
  JuliaCall::julia_assign("conc", conc)
  class(kd) <- "JuliaTuple"
  class(hb) <- "JuliaTuple"
  class(alpha) <- "JuliaTuple"
  class(beta) <- "JuliaTuple"
  JuliaCall::julia_assign("kd", kd)
  JuliaCall::julia_assign("hb", hb)
  JuliaCall::julia_assign("alpha", alpha)
  JuliaCall::julia_assign("beta", beta)
  jleval = stringr::str_interp("runIT_MCMC(time, conc, kd, hb, alpha, beta)") # ne renvoie rien mais écrit dans Obj
  return(JuliaCall::julia_eval(jleval))
}

