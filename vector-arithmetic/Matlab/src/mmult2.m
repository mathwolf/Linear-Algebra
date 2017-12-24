function D = mmult2( A, B, C )
% Matrix A times matrix B plus matrix C,
% dot product version
% GVL Algorithm 1.1.6

% Input:    A, B, C, n x n (square) matrices
% Output:   D = AB + C, an n x n matrix

n = size(A);
n = n(1);

D = C;
for i = 1:n
    for j = 1:n
        D(i,j) = D(i,j) + dotProduct(A(i,:)', B(:,j));
    end
end
end