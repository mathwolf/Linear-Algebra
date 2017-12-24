        SUBROUTINE mmult (a, dima, b, dimb, c, dimc, n)
                ! Matrix A times matrix B plus matrix C
                ! dot product version
                ! GVL algorithm 1.1.6

                ! Input:        a, b, c real n x n (square) matrices
                !               dima, dimb, dimc
                !                       integer size of each matrix
                !                       must be n or greater
                !               n       integer dimension of matrices
                ! Output:       ab + c  stored in matrix c

                IMPLICIT none
                INTEGER dima, dimb, dimc, n
                DOUBLE PRECISION a(dima, *), b(dimb, *), c(dimc, *)

                ! External function
                DOUBLE PRECISION dtprod

                ! Internal variables
                INTEGER i, j

                DO i = 1,n
                        ! update each entry in output matrix by adding the
                        ! dot product of a row from a and a col from b
                        DO j = 1,n
                                c(i,j) = c(i,j) + dtprod(a(i,1),
     &                                  dima, b(1,j), 1, n)
                        END DO
                END DO

        END SUBROUTINE
