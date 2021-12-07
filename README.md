# Wigner Functions

Oliver Gorton, San Diego State University, 2021.12.7

Library of functions for computation of Wigner 3-j, 6-j and 9-j symbols
using algebraic expressions in terms of factorials. Should be accurate
to 10^{-10} relative error for values less than about j=20.

For an analysis of relative error compared to more modern methods, see
arXiv:1504.08329 by H. T. Johansson and C. Forssen. A more accurate but
slower method involves prime factorization of integers. In old Fortran,
see work by Liqiang Wei:
Computer Physics Communications 120 (1999) 222-230.

All integer arguments are 2j in order to accomadate half-integer
arguments while taking advantage of faster integer-arithmetic.
Invalid arguments return 0d0 and program continues.

Optionally, compile with OpenMP to accelerate table initialization.

List of real(kind=8) functions:
- logfac(n)
- logdoublefac(n)
- triangle(two_j1, two_j2, two_j3)
- vector_couple(two_j1, two_m1, two_j2, two_m2, two_jc, two_mc)
- threej(two_j1, two_j2, two_j3, two_m1, two_m2, two_m3)
- threej_lookup(two_j1,two_j2,two_j3,two_l1,two_l2,two_l3)
- sixj(two_j1,two_j2,two_j3,two_l1,two_l2,two_l3)
- sixj_lookup(two_j1,two_j2,two_j3,two_l1,two_l2,two_l3)
- ninej(two_j1,two_j2,two_j3,two_j4,two_j5,two_j6,two_j7,two_j8,two_j9)

List of subroutines:
- threej_table_init(min2j, max2j)
- sixj_table_init(min2j, max2j)

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
