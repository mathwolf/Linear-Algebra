function z = gaxpy2( A, x, y )
% Matrix A times vector x plus vector y - column version
% GVL Algorithm 1.1.4

% Input:    A, an n x n (square) matrix
%           x,y real vectors of length n
% Output:   z = Ax + y, a vector length n

n = size(A);
n = n(1);

z = y;
for j = 1:n
    for i = 1:n
        z(i) = z(i) + A(i,j) * x(j);
    end
end
end