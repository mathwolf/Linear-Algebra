        FUNCTION mindex (i, j, n)
                ! When the symmetric matrix A is stored as a one-dimensional
                ! vector in column-major order, this function gives the
                ! vector index corresponding to row i, col j of the matrix.

                ! Input:        i, j    integer indices for row and col in matrix
                !               n       integer dimension of matrix
                ! Output:       mindex  integer index for vector entry
                IMPLICIT none
                INTEGER mindex
                INTEGER i, j, n

                IF (i >= j) THEN
                        ! index for entry on diagonal in col j
                        mindex = (j - 1) * n - j * (j - 3) / 2
                        ! move to correct row
                        mindex = mindex + i - j
                ELSE
                        ! index for entry on diagonal in col i
                        mindex = (i - 1) * n - i * (i - 3) / 2
                        ! move to correct row
                        mindex = mindex + j - i
                END IF
                RETURN
        END FUNCTION

        SUBROUTINE sgaxpy (a, x, dx, y, dy, n)
                ! Symmetric matrix A times vector x plus vector y
                ! column version calling Level 1 operation
                ! GVL Algorithm 1.1.3

                ! Input:        a       an n x n (square) symmetric matrix of doubles,
                !                       stored as a vectkr in column-major order
                !               dima    integer size of matrix A
                !                       must be n or greater
                !               x, y    vectors of doubles, length n
                !               dx, dy  integer spacing between entries in
                !                       each vector
                !               n       integer number of entries in each vector
                ! Output:       ax + y  stored in vector y

                IMPLICIT none
                INTEGER dx, dy, n
                DOUBLE PRECISION a(*), x(*), y(*)

                ! External function
                INTEGER mindex

                ! Internal variables
                INTEGER i, j                    ! index for column of matrix
                INTEGER xi, yi, ai              ! indices for vector entries

                xi = 1
                DO j = 1,n
                        ! add column j of matrix a times its weight from
                        ! entry j of vector x to output vector y

                        ! effect of entries in a above the diagonal, if any
                        IF (j > 1) THEN
                                yi = 1
                                DO i = 1,j-1
                                        ai = mindex(i,j,n)
                                        y(yi) = y(yi) + x(xi) * a(ai)
                                        yi = yi + dy
                                END DO
                        END IF
                        ! effect of entries in a on the diagonal or below
                        ai = mindex(j,j,n)
                        CALL saxpy(x(xi), a(ai), 1, y(j), dy, n-j+1)
                        xi = xi + dx
                END DO
                RETURN
        END SUBROUTINE
