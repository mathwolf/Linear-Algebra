function [ hatQ, hatR ] = mgs( A )
% Compute reduced QR factorization of m x n matrix A
% using modified GS process

[m, n] = size(A);
% Assume m >= n and Rank A = n on input

hatQ = zeros(m, n);
hatR = zeros(n, n);
for j = 1:n
    v = A(:,j);
    for i = 1:j-1
       hatR(i,j) =  hatQ(:,i)' * v;
       v = v - hatR(i,j) * hatQ(:,i);
    end
    hatR(j,j) = norm(v);
    hatQ(:,j) = v / norm(v);
end
end

