        SUBROUTINE mmult (a, b, c, n)
                ! Matrix A times matrix B plus matrix C
                ! dot product version
                ! GVL Algorithm 1.1.6

                ! Input:         A, B, C, n x n (square) matrices
                !               n, integer, dimension of matrix
                ! Output:       AB + C, stored in C

                IMPLICIT none
                DOUBLE PRECISION a(*), b(*), c(*)
                INTEGER n

                ! External function
                DOUBLE PRECISION dtprod

                ! Internal variables
                INTEGER i, j
                INTEGER aoff, boff, coff

                DO i = 1,n
                        DO j = 1,n
                                aoff = (i - 1)*n + 1
                                boff = j
                                coff = (i - 1) * n + j
                                c(coff) = c(coff) +
     &                                  dtprod(a(aoff), 1,
     &                                  b(boff), n, n)
                        END DO
                END DO

        END SUBROUTINE
