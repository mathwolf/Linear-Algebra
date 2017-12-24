        SUBROUTINE gaxpy (a, dima, x, dx, y, dy, n)
                ! Matrix A times vector x plus vector y - row version
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

                ! Internal variables
                INTEGER i, j            ! indices for row, column of matrix
                INTEGER xi, yi          ! indices for vector entries

                yi = 1
                DO i = 1,n
                        xi = 1
                        ! sum all the components for row i of the output vector
                        DO j = 1,n
                                y(yi) = y(yi) + a(i, j) * x(xi)
                                xi = xi + dx
                        END DO
                        yi = yi + dy
                END DO
                RETURN
        END SUBROUTINE
