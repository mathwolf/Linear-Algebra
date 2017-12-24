        SUBROUTINE mmult (a, dima, b, dimb, c, dimc, n)
                ! Matrix A times matrix B plus matrix C
                ! scalar level update
                ! GVL algorithm 1.1.5

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
                INTEGER i, j, k

                DO i = 1,n
                        DO j = 1,n
                                ! update output matrix by adding one components
                                ! at a time to each entry
                                DO k = 1,n
                                        c(i,j) = c(i,j) + a(i,k)
     &                                          * b(k,j)
                                END DO
                        END DO
                END DO
        END SUBROUTINE
