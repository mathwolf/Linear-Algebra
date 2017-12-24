        SUBROUTINE gaxpy (a, dima, x, dx, y, dy, n)
                ! Matrix A times vector x plus vector y
                ! column version calling Level 1 operation
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
                INTEGER j               ! index for column of matrix
                INTEGER xi              ! index for vector entries

                xi = 1
                DO j = 1,n
                        ! add column j of matrix times its weight to the
                        ! output vector
                        CALL saxpy(x(xi), a(1, j), 1, y, dy, n)
                        xi = xi + dx
                END DO
                RETURN
        END SUBROUTINE
