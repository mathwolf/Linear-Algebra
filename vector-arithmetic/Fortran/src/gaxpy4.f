        SUBROUTINE gaxpy (a, x, dx, y, dy, n)
                ! Matrix A times vector x plus vector y - column version
                ! using a call to a level one operation
                ! GVL Algorithm 1.1.4

                ! Input:        A, an n x n (square) matrix stored as
                !                       a vector with n^2 entries
                !               x,y real vectors of length n
                ! Output:       Ax + y, stored in vector y

                IMPLICIT none
                DOUBLE PRECISION a(*), x(*), y(*)
                INTEGER dx, dy, n

                ! Internal variables
                INTEGER j                    ! index variables
                INTEGER xoff       ! offset for vectors

                xoff = 1
                DO j = 1,n
                        CALL saxpy(x(xoff), a(j), n, y, dy, n)
                        xoff = xoff + dx
                END DO
                RETURN
        END SUBROUTINE
