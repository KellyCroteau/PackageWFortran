#include <R_ext/RS.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/*
 * Generated with tools::package_native_routine_registration_skeleton(getwd())
 */

/* FIXME:
 Check these declarations against the C/Fortran source code.
 */

/* .Fortran calls */
extern void F77_NAME(fseventyseven)(void *, void *);

static const R_FortranMethodDef FortranEntries[] = {
  {"fseventyseven", (DL_FUNC) &F77_NAME(fseventyseven), 2},
  {NULL, NULL, 0}
};

void R_init_PackageWFortran(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, NULL, FortranEntries, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
