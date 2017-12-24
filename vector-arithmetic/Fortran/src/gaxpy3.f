        SUBROUTINE gaxpy (a, x, dx, y, dy, n)
                ! Matrix A times vector x plus vector y - row version
                ! using a call to a level one operation
                ! GVL Algorithm 1.1.3

                ! Input:        A, an n x n (square) matrix stored as
                !                       a vector with n^2 entries
                !               x,y real vectors of length n
                ! Output:       Ax + y, stored in vector y

                IMPLICIT none
                DOUBLE PRECISION a(*), x(*), y(*)
                DOUBLE PRECISION dtprod
                INTEGER dx, dy, n

                ! Internal variables
                INTEGER i                  ! index variables
                INTEGER aoff, yoff        ! offset for vectors

                yoff = 1
                DO i = 1,n
                        aoff = (i - 1) * n + 1
                        y(yoff) = y(yoff) + dtprod(a(aoff),1,x,dx,n)
                        yoff = yoff + dy
                END DO
                RETURN
        END SUBROUTINE
