        SUBROUTINE mmult (a, b, c, n)
                ! Matrix A times matrix B plus matrix C
                ! column version
                ! GVL Algorithm 1.1.7

                ! Input:         A, B, C, n x n (square) matrices
                !               n, integer, dimension of matrix
                ! Output:       AB + C, stored in C

                IMPLICIT none
                DOUBLE PRECISION a(*), b(*), c(*)
                INTEGER n

                ! Internal variables
                INTEGER j, k
                INTEGER aoff, boff, coff

                DO j = 1,n
                        DO k = 1,n
                                aoff = k
                                boff = (k - 1) * n + j
                                coff = j
                                CALL saxpy ( b(boff), a(aoff), n,
     &                                  c(coff), n, n )
                        END DO
                END DO

        END SUBROUTINE
