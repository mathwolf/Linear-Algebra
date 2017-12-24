function D = mmult0( A, B, C )
% Matrix A times matrix B plus matrix C
% standard MATLAB version for reference
% GVL Algorithm 1.1.5

% Input:    A, B, C, n x n (square) matrices
% Output:   D, an n x n matrix

n = size(A);
n = n(1);

D = A * B + C;

end