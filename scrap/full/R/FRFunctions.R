#FRFunctions.R
f1 = function(x){
  result = .Fortran("fn_f1", x = as.integer(x), r = integer(1))
  print(str(result))
  return(as.integer(result$r))
}
# f1e = function(x){
#   result = .Fortran("fn_f1e", x = as.integer(x), r = integer(length(x)))
#   return(as.integer(result$r))
# }
calcspecconc = function(CConc, K, Stoich){
  #function fn_calcspecconc(NComp, NSpec, CConc, K, Stoich) result(SConc)
  result = .Fortran("fn_calcspecconc",
                    NComp = as.integer(length(CConc)),
                    NSpec = as.integer(length(K)),
                    CConc = as.double(CConc),
                    K = as.double(K),
                    Stoich = as.integer(Stoich),
                    SConc = double(length(K))
                    )
  return(as.numeric(result$SConc))
}

BobCalcSpecies = function(CConc, K, Stoich){
  cconc_tmp = single(5)
  eqk_tmp = single(10)
  sc_tmp = matrix(0,nrow = 10, ncol = 5)

  nc_tmp = length(CConc)
  ns_tmp = length(K)
  cconc_tmp[1:nc_tmp] = as.single(CConc)
  eqk_tmp[1:ns_tmp] = as.single(K)
  sc_tmp[1:ns_tmp, 1:nc_tmp] = as.integer(Stoich)

  result = .Fortran(
    "CalcSpecies",
    CConc = cconc_tmp,
    EqK = eqk_tmp,
    SC = sc_tmp,
    NC = as.integer(nc_tmp),
    NS = as.integer(ns_tmp),
    SConc = single(10)
  )
  return(as.numeric(result$SConc))
}
BobCalcLogSpecies = function(CConc, K, Stoich){
  cconc_tmp = single(5)
  logk_tmp = single(10)
  sc_tmp = matrix(0,nrow = 10, ncol = 5)

  nc_tmp = length(CConc)
  ns_tmp = length(K)
  cconc_tmp[1:nc_tmp] = as.single(CConc)
  logk_tmp[1:ns_tmp] = as.single(log10(K))
  sc_tmp[1:ns_tmp, 1:nc_tmp] = as.integer(Stoich)

  result = .Fortran(
    "CalcLogSpecies",
    CConc = cconc_tmp,
    LogK = logk_tmp,
    SC = sc_tmp,
    NC = as.integer(nc_tmp),
    NS = as.integer(ns_tmp),
    SConc = single(10)
  )
  return(as.numeric(result$SConc))
}
