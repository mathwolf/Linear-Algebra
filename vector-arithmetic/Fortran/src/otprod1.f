        SUBROUTINE otprod (a, dima, x, dx, y, dy, n)
                ! Matrix A plus the outer product of vectors x, y
                ! Column version using a call to level one operation
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
                INTEGER j
                INTEGER yi

                yi = 1
                DO j = 1,n
                        ! update one col of the output matrix
                        CALL saxpy(y(yi), x, dx, a(1,j), 1, n)
                        yi = yi + dy
                END DO
        END SUBROUTINE
