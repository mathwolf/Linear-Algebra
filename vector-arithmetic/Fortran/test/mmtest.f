        PROGRAM mmtest
                ! Test matrix multiplication
                IMPLICIT none

                DOUBLE PRECISION a(4), b(9), c(4), d(4), e(9), f(9)
                REAL r
                INTEGER i

                REAL RAND

                a(1) = 0.0
                a(2) = 1.0
                a(3) = 1.0
                a(4) = 0.0

                b(1) = DSQRT(2D0) / 2.0
                b(2) = - DSQRT(2D0) / 2.0
                b(3) = 0.0
                b(4) = - DSQRT(2D0) / 2.0
                b(5) = DSQRT(2D0) / 2.0
                b(6) = - DSQRT(2D0) / 2.0
                b(7) = 0.0
                b(8) = - DSQRT(2D0) / 2.0
                b(9) = DSQRT(2D0) / 2.0

                c(1) = 1.0
                c(2) = 2.0
                c(3) = 3.0
                c(4) = 4.0

                d(1) = 1.0
                d(2) = 0.0
                d(3) = 0.0
                d(4) = 1.0

                CALL SRAND(86456)
                DO i = 1,9
                        r = RAND()
                        r = 2.0 * (r - 1.0)
                        e(i) = r
                END DO

                f(1) = 1.0
                f(2) = 0.0
                f(3) = 0.0
                f(4) = 0.0
                f(5) = 1.0
                f(6) = 0.0
                f(7) = 0.0
                f(8) = 0.0
                f(9) = 1.0

                DO i = 1,9
                        e(i) = 0.0
                END DO

                CALL mmult (c, d, a, 2)
                WRITE (*,*) a
                CALL mmult (b, b, e, 3)
                WRITE (*,*) e
        END PROGRAM
