# Wigner Functions
Library for Wigner 3-j 6-j and 9-j functions using Racah equations from Edmonds

## 3-J and 6-J Symbols
Real function. Arguments of the function are twice those computed. For each of the following functions and routines, an equivalent one exists for the 'three'-J symbol.

        function sixj(j1,j2,j3,l1,l2,l3) result(sj)

            ! Computes the wigner six-j symbol with arguments
            !    j1/2 j2/2 j3/2
            !    l1/2 l2/2 l3/2
            ! using explicit algebraic expressions from Edmonds (1955/7)

            implicit none
            integer :: j1,j2,j3,l1,l2,l3
            real(kind8) :: sj

Lookup table initialization. Optional arguments set the lower and upper limits of values stored in the table.

        subroutine sixj_table_init(min2j, max2j)

            implicit none
            integer, optional :: min2j, max2j

Lookup table lookup-function. This function tries to lookup the requested symbols in the allocated table, otherwise it calls the `sixj` function.

    function sixj_lookup(j1,j2,j3,l1,l2,l3) result(sj)

        implicit none
        integer :: j1,j2,j3,l1,l2,l3
        real(kind=8) :: sj

## 9-J Symbol
Real function. We don't include lookup table functions for the 9-J function.

        function ninej(j1,j2,j3,j4,j5,j6,j7,j8,j9) result(nj)

            ! Computes the wigner nine-j symbol with arguments
            !   j1/2 j2/2 j3/2
            !   j4/2 j5/2 j6/2
            !   j7/2 j8/2 j9/2

            implicit none
            integer :: j1,j2,j3,j4,j5,j6,j7,j8,j9
            real(kind=8) :: nj
