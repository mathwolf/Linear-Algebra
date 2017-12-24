        SUBROUTINE gaxpy (a, dima, x, dx, y, dy, n)
                ! Matrix A times vector x plus vector y - column version
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

                xi = 1
                DO j = 1,n
                        yi = 1
                        ! add column j of matrix times its weight to the
                        ! output vector
                        DO i = 1,n
                                y(yi) = y(yi) + a(i, j) * x(xi)
                                yi = yi + dy
                        END DO
                        xi = xi + dx
                END DO
                RETURN
        END SUBROUTINE
