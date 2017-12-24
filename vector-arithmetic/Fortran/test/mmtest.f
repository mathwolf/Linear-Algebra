        PROGRAM mmtest
                ! Test matrix multiplication
                IMPLICIT none

                DOUBLE PRECISION a(2,2), b(3,3), c(2,2)
                DOUBLE PRECISION d(2,2), e(3,3), f(3,3)
                REAL r
                INTEGER i, j

                REAL RAND

                a(1,1) = 0.0
                a(1,2) = 1.0
                a(2,1) = 1.0
                a(2,2) = 0.0

                b(1,1) = DSQRT(2D0) / 2.0
                b(1,2) = - DSQRT(2D0) / 2.0
                b(1,3) = 0.0
                b(2,1) = - DSQRT(2D0) / 2.0
                b(2,2) = DSQRT(2D0) / 2.0
                b(2,3) = - DSQRT(2D0) / 2.0
                b(3,1) = 0.0
                b(3,2) = - DSQRT(2D0) / 2.0
                b(3,3) = DSQRT(2D0) / 2.0

                c(1,1) = 1.0
                c(1,2) = 2.0
                c(2,1) = 3.0
                c(2,2) = 4.0

                d(1,1) = 1.0
                d(1,2) = 0.0
                d(2,1) = 0.0
                d(2,2) = 1.0

                CALL SRAND(86456)
                DO i = 1,3
                        DO j = 1,3
                                r = RAND()
                                r = 2.0 * (r - 1.0)
                                e(i,j) = r
                        END DO
                END DO

                f(1,1) = 1.0
                f(1,2) = 0.0
                f(1,3) = 0.0
                f(2,1) = 0.0
                f(2,2) = 1.0
                f(2,3) = 0.0
                f(3,1) = 0.0
                f(3,2) = 0.0
                f(3,3) = 1.0

                DO i = 1,3
                        DO j = 1,3
                                e(i,j) = 0.0
                        END DO
                END DO

                CALL mmult (c, 2, d, 2, a, 2, 2)
                WRITE (*,*) a
                CALL mmult (b, 3, b, 3, e, 3, 3)
                WRITE (*,*) e
        END PROGRAM
