        SUBROUTINE mmult (a, dima, b, dimb, c, dimc, n)
                ! Matrix A times matrix B plus matrix C
                ! column version
                ! GVL Algorithm 1.1.7

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
                INTEGER j, k

                DO j = 1,n
                        ! update each column in the output matrix
                        ! by adding scalar multiples of columns of a
                        DO k = 1,n
                                CALL saxpy ( b(k,j), a(1,k), 1,
     &                                  c(1,j), 1, n )
                        END DO
                END DO

        END SUBROUTINE
