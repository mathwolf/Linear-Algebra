        PROGRAM gxtest
                ! Test gaxpy operation
                IMPLICIT none

                DOUBLE PRECISION a(4), x(2), y(2), z(2)

                a(1) =0.0
                a(2) = -1.0
                a(3) = 1.0
                a(4) = 0.0
                x(1) = 3.0
                x(2) = 4.0
                y(1) = DSQRT(2D0) / 2.0
                y(2) = DSQRT(2D0) / 2.0
                z(1) = 0.0
                z(2) = 0.0

                CALL gaxpy(a, x, 1, z, 1, 2)
                WRITE (*,*) z

                a(1) =1.0
                a(2) = -1.0
                a(3) = 1.0
                a(4) = 1.0

                CALL gaxpy(a, y, 1, x, 1, 2)
                WRITE (*,*) x
        END PROGRAM
