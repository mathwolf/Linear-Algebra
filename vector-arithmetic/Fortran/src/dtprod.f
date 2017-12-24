        DOUBLE PRECISION FUNCTION dtprod (x, dx, y, dy, n)
                ! Dot product of two real vectors
                ! GVL Algorithm 1.1.1

                ! Input: real-valued vectors x, y that have length n
                ! Output: their scalar dot product

                IMPLICIT none
                DOUBLE PRECISION x(*), y(*)
                INTEGER dx, dy, n

                INTEGER i
                INTEGER xoff, yoff

                dtprod = 0.0
                xoff =  1
                yoff = 1
                DO i = 1, n
                        dtprod = dtprod + x(xoff) * y(yoff)
                        xoff = xoff + dx
                        yoff = yoff + dy
                END DO
                RETURN
        END
