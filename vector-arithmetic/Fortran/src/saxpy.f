        SUBROUTINE saxpy (a, x, dx, y, dy, n)
                ! Scalar a times vector x plus vector y
                ! GVL Algorithm 1.1.2

                ! Input:        a, scalar
                !               x, y, vectors of length n
                !               dx, dy steps between entries of each vector
                ! Output:       ax + y, stored in vector y

                IMPLICIT none
                DOUBLE PRECISION a
                DOUBLE PRECISION x(*), y(*)
                INTEGER dx, dy, n

                INTEGER i, xoff, yoff

                xoff = 1
                yoff = 1
                DO i = 1, n
                        y(yoff) = a * x(xoff) + y(yoff)
                        xoff = xoff + dx
                        yoff = yoff + dy
                END DO
                RETURN
        END SUBROUTINE
