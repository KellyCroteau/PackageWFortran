subroutine CalcSpecies(CConc, EqK, SC, NC, NS, SConc)
    !
    ! Purpose:
    !   To calculate a vector species concentrations
    !   for a generic speciation problem given:
    !      1) an input vector of component concentrations
    !      2) an input vector of equilibrium constants
    !      3) a matrix of stoichiometric coefficients.
    !
    ! Constant definitions
    ! ==========================================
        ! We should not need these
        integer, parameter :: MaxComp = 5
        integer, parameter :: MaxSpecies = 10
    ! Variable definitions
    ! ==========================================
    !
    ! Inputs:
        real, intent(in), dimension(MaxComp) :: CConc              ! Vector of component concentrations (1xNC)
        real, intent(in), dimension(MaxSpecies) :: EqK             ! Vector of equilibrium constants (1xNC)
        integer, intent(in), dimension(MaxSpecies, MaxComp) :: SC  ! Array of stoichiometric coefficients (NSxNC)
        integer, intent(in) :: NC                                  ! Number of components
        integer, intent(in) :: NS                                  ! Number of species
    ! Output:
        real, intent(out), dimension(MaxSpecies) :: SConc          ! Vector of species concentrations
    !
    ! local variables
        integer i, j           ! index variables
    !
    ! Perform calculations
    do i=1, NS      ! loop over each species
        SConc(i) = EqK(i)
        do j=1, NC  ! loop over each component
            SConc(i) = SConc(i) * (CConc(j)**SC(i,j))
        end do
    end do

end subroutine CalcSpecies

subroutine CalcLogSpecies(LogCConc, LogK, SC, NC, NS, LogSConc)
    !
    ! Purpose:
    !   To calculate a vector of Log10 species concentrations
    !   for a generic speciation problem given:
    !      1) an input vector of Log10 component concentrations
    !      2) an input vector of Log10 equilibrium constants
    !      3) a matrix of stoichiometric coefficients.
    !
    ! Constant definitions
    ! ==========================================
        ! We should not need these
        integer, parameter :: MaxComp = 5
        integer, parameter :: MaxSpecies = 10
    ! Variable definitions
    ! ==========================================
    !
    ! Inputs:
        real, intent(in), dimension(MaxComp) :: LogCConc          ! Vector of Log10 component concentrations (1xNC)
        real, intent(in), dimension(MaxSpecies) :: LogK           ! Vector of Log10 equilibrium constants (1xNC)
        integer, intent(in), dimension(MaxSpecies, MaxComp) :: SC ! Array of stoichiometric coefficients (NSxNC)
        integer, intent(in) :: NC                                 ! Number of components
        integer, intent(in) :: NS                                 ! Number of species
    ! Output:
        real, intent(out), dimension(MaxSpecies) :: LogSConc      ! Vector of Log10 species concentrations
    !
    ! local variables
        integer i, j           ! index variables
    !
    ! Perform calculations
    do i=1, NS      ! loop over each species
        LogSConc(i) = LogK(i)
        do j=1, NC  ! loop over each component
            LogSConc(i) = LogSConc(i) + (LogCConc(j)*SC(i,j))
        end do
    end do

end subroutine CalcLogSpecies
