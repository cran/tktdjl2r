#' @import JuliaCall
#' @import stringr
#'
#'
NULL


#' Setup tktdjl2
#'
#' This function initializes Julia and the TKTDsimulation.jl package.
#' The first time will be long since it includes precompilation.
#'
#' @param ... Parameters are passed down to JuliaCall::julia_setup
#'
#' @examples
#'
#' \donttest{ ## tktdjl2r_setup() is time-consuming and requires Julia+TKTDsimulations.jl
#'
#' tktdjl2r::tktdjl2r_setup()
#'
#' }
#'
#' @export
tktdjl2r_setup <- function (...){
  julia <- JuliaCall::julia_setup(...)
  JuliaCall::julia_install_package_if_needed("TKTDsimulations")
  JuliaCall::julia_library("TKTDsimulations")
}
