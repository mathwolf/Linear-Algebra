function D = mmult4( A, B, C )
% Matrix A times matrix B plus matrix C
% outer product formulation
% GVL Algorithm 1.1.8

% Input:    A, B, C, n x n (square) matrices
% Output:   D, an n x n matrix

n = size(A);
n = n(1);

D = C;
for k = 1:n
    D = outerProduct(D, A(:,k), B(k,:)');
end
end