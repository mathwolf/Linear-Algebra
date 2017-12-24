        PROGRAM dttest
                IMPLICIT none

                DOUBLE PRECISION x(2), y(2)
                DOUBLE PRECISION dtprod

                x(1) = 3.0
                x(2) = 4.0
                y(1) = DSQRT(2.0D0) / 2.0
                y(2) = DSQRT(2.0D0) / 2.0

                WRITE(*,*) dtprod(x, 1, y, 1, 2)
                WRITE(*,*) dtprod(y, 1, y, 1, 2)
                WRITE(*,*) dtprod(x, 1, x, 1, 2)
        END PROGRAM
