        SUBROUTINE gaxpy (a, dima, x, dx, y, dy, n)
                ! Matrix A times vector x plus vector y
                ! row version calling Level 1 operation
                ! GVL Algorithm 1.1.3

                ! Input:        a       an n x n (square) matrix of doubles
                !               dima    integer size of matrix A
                !                       must be n or greater
                !               x, y    vectors of doubles, length n
                !               dx, dy  integer spacing between entries in
                !                       each vector
                !               n       integer number of entries in each vector
                ! Output:       ax + y  stored in vector y

                IMPLICIT none
                INTEGER dima, dx, dy, n
                DOUBLE PRECISION a(dima, *), x(*), y(*)

                ! External function
                DOUBLE PRECISION dtprod

                ! Internal variables
                INTEGER i               ! index for row of matrix
                INTEGER yi              ! index for vector entries

                yi = 1
                DO i = 1,n
                        ! take the dot product of one row of a with vector
                        ! x, add the result to output vector
                        y(yi) = y(yi) + dtprod(a(i,1),dima,x,dx,n)
                        yi = yi + dy
                END DO
                RETURN
        END SUBROUTINE
