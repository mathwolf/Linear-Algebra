function [L, U] = gauss(A)
% Use gaussian elimination without pivoting to 
% compute LU factorization of A

m = size(A,1);
% Assume A is square and nonsingular on input

L = zeros(m, m);
for k = 1:m
    L(k,k) = 1;
    % Create zeros below a_k,k
    for i = k+1:m
       c = A(i,k) / A(k,k);
       L(i,k) = c;
       A(i,k:m) = A(i,k:m) - c * A(k,k:m);
    end
end
U = A;
end

