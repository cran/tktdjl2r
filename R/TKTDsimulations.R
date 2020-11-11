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




