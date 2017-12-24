        SUBROUTINE mmult (a, b, c, n)
                ! Matrix A times matrix B plus matrix C
                ! scalar level update
                ! GVL Algorithm 1.1.5

                ! Input:         A, B, C, n x n (square) matrices
                !               n, integer, dimension of matrix
                ! Output:       AB + C, stored in C

                IMPLICIT none
                DOUBLE PRECISION a(*), b(*), c(*)
                INTEGER n

                ! Internal variables
                INTEGER i, j, k
                INTEGER aoff, boff, coff

                DO i = 1,n
                        DO j = 1,n
                                coff = (i - 1) * n + j
                                DO k = 1,n
                                        aoff = (i - 1) * n + k
                                        boff = (k - 1) * n + j
                                        c(coff) = c(coff) + a(aoff)
     &                                          * b(boff)
                                END DO
                        END DO
                END DO
        END SUBROUTINE
