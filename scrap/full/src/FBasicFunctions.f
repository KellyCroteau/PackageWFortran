      subroutine FAdditionTest(A, B, C)
            use, intrinsic :: iso_c_binding, only: dp=>c_double
            real(dp), intent(in) :: A, B
            real(dp), intent(out) :: C
            C = A + B
      end subroutine FAdditionTest

      subroutine FMultiplyTest(A, B, C)
            use, intrinsic :: iso_c_binding, only: dp=>c_double
            real(dp), intent(in) :: A, B
            real(dp), intent(out) :: C
            C = A * B
      end subroutine FMultiplyTest

      subroutine FPowerTest(Base, Power, C)
            use, intrinsic :: iso_c_binding, only: dp=>c_double
            real(dp), intent(in) :: Base, Power
            real(dp), intent(out) :: C
            C = Base ** Power
      end subroutine FPowerTest

      subroutine FForLoopTest(NumIter)
            use, intrinsic :: iso_c_binding, only: int64=>c_long
            integer(int64), intent(in) :: NumIter
            integer(int64) :: i
            do i = 0, NumIter
c              C = A + B;
            end do
      end subroutine FForLoopTest

      subroutine FAdditionLoopTest(NumIter, A, B)
            use, intrinsic :: iso_c_binding, only: dp=>c_double, 
     *             int64=>c_long
            integer(int64), intent(in) :: NumIter
            real(dp), intent(in) :: A, B
            real(dp) :: C
            integer(int64) :: i
            do i = 0, NumIter
              C = A + B
            end do
      end subroutine FAdditionLoopTest

      subroutine FMultiplyLoopTest(NumIter, A, B)
            use, intrinsic :: iso_c_binding, only: dp=>c_double, 
     *             int64=>c_long
            integer(int64), intent(in) :: NumIter
            real(dp), intent(in) :: A, B
            real(dp) :: C
            integer(int64) :: i
            do i = 0, NumIter
              C = A * B
            end do
      end subroutine FMultiplyLoopTest

      subroutine FPowerLoopTest(NumIter, Base, Power)
            use, intrinsic :: iso_c_binding, only: dp=>c_double, 
     *             int64=>c_long
            integer(int64), intent(in) :: NumIter
            real(dp), intent(in) :: Base, Power
            real(dp) :: C
            integer(int64) :: i
            do i = 0, NumIter
                  C = Base ** Power
            end do
      end subroutine FPowerLoopTest

      subroutine FTestEverything(NumIter, ABase, Badd, BPow, r)
           use, intrinsic :: iso_c_binding, only: dp=>c_double, 
     *             int64=>c_long
            integer(int64), intent(in) :: NumIter
           real(dp), intent(in) :: ABase, Badd, BPow
           logical, intent(out) :: r
           real(dp) :: C
           integer(int64) :: i
           
           r = .false.
           
           do i = 0, NumIter
               call FAdditionTest(ABase, Badd, C)
           end do
           call FAdditionLoopTest(NumIter, ABase, Badd)
           
           do i = 0, NumIter
               call FMultiplyTest(ABase, BPow, C)
           end do
           call FMultiplyLoopTest(NumIter, ABase, BPow)
           
           do i = 0, NumIter
               call FPowerTest(ABase, BPow, C)
           end do
           call FPowerLoopTest(NumIter, ABase, BPow)
           
           call FForLoopTest(NumIter)
           
           r = .true.
           
      end subroutine FTestEverything