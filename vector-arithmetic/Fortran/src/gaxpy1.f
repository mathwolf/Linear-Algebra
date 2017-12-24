        SUBROUTINE gaxpy (a, x, dx, y, dy, n)
                ! Matrix A times vector x plus vector y - column version
                ! GVL Algorithm 1.1.4

                ! Input:        A, an n x n (square) matrix stored as
                !                       a vector with n^2 entries
                !               x,y real vectors of length n
                ! Output:       Ax + y, stored in vector y

                IMPLICIT none
                DOUBLE PRECISION a(*), x(*), y(*)
                INTEGER dx, dy, n

                ! Internal variables
                INTEGER i, j                    ! index variables
                INTEGER aoff, xoff, yoff        ! offset for vectors

                xoff = 1
                DO j = 1,n
                        yoff = 1
                        DO i = 1,n
                                aoff = (i - 1) * n + j
                                y(yoff) = y(yoff) + a(aoff) * x(xoff)
                                yoff = yoff + dy
                        END DO
                        xoff = xoff + dx
                END DO
                RETURN
        END SUBROUTINE
