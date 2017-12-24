        PROGRAM sxtest
                ! Test saxpy operation
                IMPLICIT none

                DOUBLE PRECISION x(2), y(2)
                DOUBLE PRECISION a

                x(1) = 3.0
                x(2) = 4.0
                y(1) = DSQRT(2.0D0) / 2.0
                y(2) = DSQRT(2.0D0) / 2.0
                a = 1.0

                CALL saxpy(a, x, 1, x, 1, 2)
                WRITE(*,*) x

                a = 2.0

                CALL saxpy(a, y, 1, y, 1, 2)
                WRITE(*,*) y

                x(1) = 3.0
                x(2) = 4.0
                y(1) = DSQRT(2.0D0) / 2.0
                y(2) = DSQRT(2.0D0) / 2.0
                a = 3.0

                CALL saxpy(a, x, 1, y, 1, 2)
                WRITE(*,*) y

        END PROGRAM
