[View the docs](https://ogorton.github.io/wigner/)

[Download the docs](wignerdocs.pdf)

This is a library of functions for computation of Wigner 3-j, 6-j and 9-j
symbols using algebraic expressions in terms of factorials. It is expected to 
be accurate to $10^{-10}$ relative error for values less than about j=20.

List of real(kind=8) functions:

- `logfac(n)`
- `logdoublefac(n)`
- `triangle(two_j1, two_j2, two_j3)`
- `vector_couple(two_j1, two_m1, two_j2, two_m2, two_jc, two_mc)`
- `threej(two_j1, two_j2, two_j3, two_m1, two_m2, two_m3)`
- `threej_lookup(two_j1,two_j2,two_j3,two_l1,two_l2,two_l3)`
- `sixj(two_j1,two_j2,two_j3,two_l1,two_l2,two_l3)`
- `sixj_lookup(two_j1,two_j2,two_j3,two_l1,two_l2,two_l3)`
- `ninej(two_j1,two_j2,two_j3,two_j4,two_j5,two_j6,two_j7,two_j8,two_j9)`

List of subroutines:

- `threej_table_init(min2j, max2j)`
- `sixj_table_init(min2j, max2j)`

All integer arguments are 2j in order to accomadate half-integer
arguments while taking advantage of faster integer-arithmetic.
Invalid arguments return 0d0 and program continues.

Optionally, compile with OpenMP to accelerate table initialization.
