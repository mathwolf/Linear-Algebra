        SUBROUTINE mmult (a, b, c, n)
                ! Matrix A times matrix B plus matrix C
                ! outer product version
                ! GVL Algorithm 1.1.8

                ! Input:         A, B, C, n x n (square) matrices
                !               n, integer, dimension of matrix
                ! Output:       AB + C, stored in C

                IMPLICIT none
                DOUBLE PRECISION a(*), b(*), c(*)
                INTEGER n

                ! Internal variables
                INTEGER k
                INTEGER aoff, boff

                DO k = 1,n
                        aoff = k
                        boff = (k - 1) * n + 1
                        CALL otprod ( c, a(aoff), n,
     &                          b(boff), 1, n )
                END DO

        END SUBROUTINE
