#' Add 77 to a real number using a Fortran77 function
#'
#' @param X A real number
#'
#' @return A real number
#' @export
#'
#' @examples
#' x = 1
#' ## Not RUN:
#' ## R_fseventyseven(x)
R_fseventyseven = function(X){
  result = .Fortran("fseventyseven",
                    X = as.single(X),
                    R = single(1),
                    PACKAGE = "PackageWFortran")
  return(as.numeric(result$R))
}
