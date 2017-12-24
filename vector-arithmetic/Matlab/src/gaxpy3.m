function z = gaxpy3( A, x, y )
% Matrix A times vector x plus vector y - row version
% written with colon notation
% GVL Algorithm 1.1.4 update

% Input:    A, an n x n (square) matrix
%           x,y real vectors of length n
% Output:   z = Ax + y, a vector length n

n = size(A);
n = n(1);

z = y;
for i = 1:n
    z(i) = z(i) + A(i,:) * x;
end
end