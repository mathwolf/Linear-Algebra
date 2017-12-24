function B = outerProduct1( A, x, y )
% Update matrix A with the outer product of vectors x and y
% row version, calling a level 1 operation
% GVL Algorithm 1.1.2

% Input:    A, an n x n (square) matrix
%           x,y vectors of length n
% Output:   B = A + xy', result of adding the outer product of x,y to A
n = size(x);
n = n(1);

B = A;
for i = 1:n
    B(i,:) = saxpy(x(i), y, B(i,:)')';
end

end

