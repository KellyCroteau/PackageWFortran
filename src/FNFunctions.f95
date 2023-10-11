!FNFunctions.f95

subroutine fn_f1(x, r)
  integer, intent(in) :: x
  integer, intent(out) :: r
  r = x + 1
end subroutine

! integer elemental function fn_f1e_f(x) result(r)
!   integer, intent(in) :: x
!   r = x + 1
! end function
! 
! subroutine fn_f1e(x, r)
!   integer, intent(in) :: x(:)
!   integer, intent(out) :: r(:)
!   r = fn_f1e_f(x)
! end subroutine
! 
! subroutine fn_f1a(x, r)
!   integer, intent(in) :: x(:)
!   integer, intent(out) :: r(:)
!   r = x + 1
! end subroutine

subroutine fn_calcspecconc(NComp, NSpec, CConc, K, Stoich, SConc)

  use, intrinsic :: iso_c_binding, only: dp=>c_double

  integer, intent(in) :: NComp, NSpec
  real(dp), intent(in) :: CConc(:)
  real(dp), intent(in) :: K(:)
  integer, intent(in) :: Stoich(:, :)
  real(dp), intent(out) :: SConc(NSpec)
  integer :: iSpec
  integer :: iComp
  real(dp) :: Tmp

  do iSpec = 1, NSpec
    Tmp = 1
    do iComp = 1, NComp
      Tmp = Tmp * (CConc(iComp) ** Stoich(iSpec, iComp))
    end do
    SConc(iSpec) = Tmp * K(iSpec)
  end do

end subroutine fn_calcspecconc
