# tryCatch(dyn.unload("src/FBasicFunctions.dll"))
# system("R CMD SHLIB src/FBasicFunctions.f")
# dyn.load("src/FBasicFunctions.dll")

R_FAdditionTest = function(A, B) {
  results = .Fortran("FAdditionTest",
                     A = as.double(A),
                     B = as.double(B),
                     C = double(1))
  return(as.numeric(results$C))
}

R_FMultiplyTest = function(A, B) {
  results = .Fortran("FMultiplyTest",
                     A = as.double(A),
                     B = as.double(B),
                     C = double(1))
  return(as.numeric(results$C))
}# FMultiplyTest

R_FPowerTest = function(Base, Power) {
  results = .Fortran(
    "FPowerTest",
    Base = as.double(Base),
    Power = as.double(Power),
    C = double(1)
  )
  return(as.numeric(results$C))
}# FPowerTest

R_FForLoopTest = function(NumIter){
  .Fortran(
    "FForLoopTest",
    NumIter = as.integer(NumIter)
  )
  return(T)
}# FForLoopTest

R_FAdditionLoopTest = function(NumIter, A, B){
  .Fortran(
    "FAdditionLoopTest",
    NumIter = as.integer(NumIter),
    A = as.double(A),
    B = as.double(B)
  )
  return(T)
}# FAdditionLoopTest

R_FMultiplyLoopTest = function(NumIter, A, B){
  .Fortran(
    "FMultiplyLoopTest",
    NumIter = as.integer(NumIter),
    A = as.double(A),
    B = as.double(B)
  )
  return(T)
}# FMultiplyLoopTest

R_FPowerLoopTest = function(NumIter, Base, Power){
  .Fortran(
    "FPowerLoopTest",
    NumIter = as.integer(NumIter),
    Base = as.double(Base),
    Power = as.double(Power)
  )
  return(T)
}# FPowerLoopTest

R_FTestEverything = function(NumIter, ABase, Badd, BPow){

  result = .Fortran(
    "FTestEverything",
    NumIter = as.integer(NumIter),
    ABase = as.double(ABase),
    Badd = as.double(Badd),
    BPow = as.double(BPow),
    r = logical(1)
  )
  return(result$r)

}


