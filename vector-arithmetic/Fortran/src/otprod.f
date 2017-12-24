        SUBROUTINE otprod (a, x, dx, y, dy, n)
                ! Matrix A plus the outer product of vectors x, y
                ! Row version using a call to level one operation
                ! GVL unnumbered algorithm, section 1.1.9

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
                INTEGER i
                INTEGER aoff, xoff

                xoff = 1
                DO i = 1,n
                        aoff = (i - 1) * n + 1
                        CALL saxpy(x(xoff), y, dy, a(aoff), 1, n)
                        xoff = xoff + dx
                END DO
        END SUBROUTINE
