        SUBROUTINE mmult (a, dima, b, dimb, c, dimc, n)
                ! Matrix A times matrix B plus matrix C
                ! outer product version
                ! GVL Algorithm 1.1.8

                ! Input:        a, b, c real n x n (square) matrices
                !               dima, dimb, dimc
                !                       integer size of each matrix
                !                       must be n or greater
                !               n       integer dimension of matrices
                ! Output:       ab + c  stored in matrix c

                IMPLICIT none
                INTEGER dima, dimb, dimc, n
                DOUBLE PRECISION a(dima, *), b(dimb, *), c(dimc, *)

                ! Internal variables
                INTEGER k

                DO k = 1,n
                        CALL otprod ( c, dimc, a(1, k), 1,
     &                          b(k, 1), dimb, n )
                END DO

        END SUBROUTINE
