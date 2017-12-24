function z = gaxpy6( A, x, y )
% Matrix A times vector x plus vector y - column version
% written to call level 1 operation
% GVL Algorithm 1.1.4 update

% Input:    A, an n x n (square) matrix
%           x,y real vectors of length n
% Output:   z = Ax + y, a vector length n

n = size(A);
n = n(1);

z = y;
for j = 1:n
    z = saxpy(x(j), A(:,j), z);
end
end