function D = mmult3( A, B, C )
% Matrix A times matrix B plus matrix C
% column version
% GVL Algorithm 1.1.7

% Input:    A, B, C, n x n (square) matrices
% Output:   D, an n x n matrix

n = size(A);
n = n(1);

D = C;
for j = 1:n
    for k = 1:n
        D(:,j) = saxpy(B(k,j), A(:,k), D(:,j));
    end
end
end