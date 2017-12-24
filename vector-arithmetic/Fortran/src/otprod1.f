        SUBROUTINE otprod (a, x, dx, y, dy, n)
                ! Matrix A plus the outer product of vectors x, y
                ! Column version using a call to level one operation
                ! GVL in section 1.1.9

                ! Input:        A, an n x n (square) matrix stored as
                !                       a vector with n^2 entries
                !               x,y real vectors of length n
                !               dx, dy integer spacing between entries of
                !               each vector
                ! Output:       A + xy', stored in A

                IMPLICIT none
                DOUBLE PRECISION a(*), x(*), y(*)
                INTEGER dx, dy, n

                ! Internal variables
                INTEGER j
                INTEGER aoff, yoff

                yoff = 1
                DO j = 1,n
                        aoff = j
                        CALL saxpy(y(yoff), x, dx, a(aoff), n, n)
                        yoff = yoff + dy
                END DO
        END SUBROUTINE
