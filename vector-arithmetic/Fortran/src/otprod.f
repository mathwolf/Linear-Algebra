        SUBROUTINE otprod (a, dima, x, dx, y, dy, n)
                ! Matrix A plus the outer product of vectors x, y
                ! Row version using a call to level one operation
                ! GVL unnumbered algorithm, section 1.1.9

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

                ! Internal variables
                INTEGER i
                INTEGER xi

                xi = 1
                DO i = 1,n
                        ! update one row of the output matrix
                        CALL saxpy(x(xi), y, dy, a(i,1), dima, n)
                        xi = xi + dx
                END DO
        END SUBROUTINE
