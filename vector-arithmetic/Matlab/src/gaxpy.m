function z = gaxpy( A, x, y )
% Matrix A times vector x plus vector y - row version
% GVL Algorithm 1.1.3

% Input:    A an n x n (square) matrix
%           x,y real vectors of length n
% Output:   z = Ax + y, a vector length n

n = size(A);
n = n(1);

z = zeros(n,1);
for i = 1:n
    for j = 1:n
        z(i) = z(i) + A(i,j) * x(j);
    end
    z(i) = z(i) + y(i);
end
end