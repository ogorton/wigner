program main

    use wigner
    implicit none
    logical :: timeit
    integer (kind=8) :: ti, tf, clock_rate
    real :: rn
    real*8 x, y, z
    integer :: i,j,k,l,m,n, a,b

    integer :: minsj2i, maxsj2i

    minsj2i = tablemin2j
    maxsj2i = tablemax2j


    call sixj_table_init(0,22)
    call threej_table_init()

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
                        enddo
                    enddo
                enddo
            enddo
        enddo
    enddo

    call system_clock(count = tf)
    print*,'Time:',real((tf-ti))/real(clock_rate)


end program
