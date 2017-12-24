function B = outerProduct2( A, x, y )
% Update matrix A with the outer product of vectors x and y
% column version, calling level 1 operation
% GVL Algorithm 1.1.2

% Input:    A, an n x n (square) matrix
%           x,y vectors of length n
% Output:   B = A + xy', result of adding the outer product of x,y to A
n = size(x);
n = n(1);

B = A;
for j = 1:n
    B(:,j) = saxpy(y(j), x, B(:,j));
end

end

