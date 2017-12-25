        PROGRAM sgxtest
                ! Test gaxpy operation for symmetric matrices
                IMPLICIT none

                DOUBLE PRECISION a(3), eye(3), x(2), y(2), z(2)
                DOUBLE PRECISION b(6), u(3), v(3)

                a(1) = 2.0
                a(2) = 3.0
                a(3) = 4.0

                eye(1) = 1.0
                eye(2) = 0.0
                eye(3) = 1.0

                x(1) = 3.0
                x(2) = 4.0
                y(1) = DSQRT(2D0) / 2.0
                y(2) = DSQRT(2D0) / 2.0
                z(1) = 1.0
                z(2) = 2.0

                CALL sgaxpy (eye, y, 1, z, 1, 2)
                WRITE (*,*) z

                z(1) = 1.0
                z(2) = 2.0

                CALL sgaxpy (a, x, 1, z, 1, 2)
                WRITE (*,*) z

                b(1) = 1.0
                b(2) = 2.0
                b(3) = 3.0
                b(4) = 4.0
                b(5) = 5.0
                b(6) = 6.0

                u(1) = 11.0
                u(2) = 13.0
                u(3) = 15.0

                v(1) = -1.0
                v(2) = 1.0
                v(3) = 2.0

                CALL sgaxpy(b, u, 1, v, 1, 3)
                WRITE (*,*) v
        END PROGRAM
