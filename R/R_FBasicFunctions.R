#' Add 77 to a real number using a Fortran77 function
#'
#' @param X A real number
#'
#' @return A real number
#' @export
#'
#' @examples
#' x = 1
#' R_F77(x)
R_F77 = function(X){
  result = .Fortran("F77",
                    X = as.single(X),
                    R = single(1))
  return(as.numeric(result$R))
}
