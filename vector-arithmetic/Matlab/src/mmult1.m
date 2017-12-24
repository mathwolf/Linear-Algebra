function D = mmult1( A, B, C )
% Matrix A times matrix B plus matrix C
% scalar level update
% GVL Algorithm 1.1.5

% Input:    A, B, C, n x n (square) matrices
% Output:   D, an n x n matrix

n = size(A);
n = n(1);

D = C;
for i = 1:n
    for j = 1:n
        for k = 1:n
            D(i,j) = D(i,j) + A(i,k) * B(k,j);
        end
    end
end
end