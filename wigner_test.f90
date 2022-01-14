program main

    ! ============================================================================
    ! MIT License
    !
    ! Copyright (c) 2022 Oliver C. Gorton (ogorton@sdsu.edu)
    ! 
    ! Permission is hereby granted, free of charge, to any person obtaining a copy
    ! of this software and associated documentation files (the "Software"), to deal
    ! in the Software without restriction, including without limitation the rights
    ! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    ! copies of the Software, and to permit persons to whom the Software is
    ! furnished to do so, subject to the following conditions:
    ! 
    ! The above copyright notice and this permission notice shall be included in all
    ! copies or substantial portions of the Software.
    ! 
    ! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    ! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    ! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    ! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    ! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    ! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    ! SOFTWARE.
    ! ============================================================================    

    use wigner
    implicit none
    logical :: timeit
    integer (kind=8) :: ti, tf, clock_rate
    real :: rn
    real*8 x, y, z
    integer :: i,j,k,l,m,n,a,b

    integer :: minsj2i, maxsj2i

    minsj2i = tablemin2j
    maxsj2i = tablemax2j

    call threej_table_init(0,12)
    call sixj_table_init(0,12)

    call system_clock(count_rate = clock_rate)
    call system_clock(count = ti)

    do n = minsj2i, maxsj2i
        print*,'Jx2=',n
        do m = minsj2i, maxsj2i
            do l = minsj2i, maxsj2i
                do k = minsj2i, maxsj2i
                    do j = minsj2i, maxsj2i
                        do i = minsj2i, maxsj2i
                           x = threej(i, j, k, l, m, n)
                           y = sixj(i, j, k, l, m, n)
                        enddo
                    enddo
                enddo
            enddo
        enddo
    enddo

    print*,"Example sixj value, sixj(1,3,5,1,1,3):",sixj(2,4,6,4,2,4)

    call system_clock(count = tf)
    print*,'Time:',real((tf-ti))/real(clock_rate)

end program
