function [hatQ, hatR] = house(A)
% Create reduced QR factorization of an mxn matrix A

[m, n] = size(A);
% Full QR factorization via Householder matrices.
% At end of loop, A will be mxn diagonal.
% Unit Householder vectors u1,...,un are stored in V.
V = zeros(m,n);
for k = 1:n
   x = A(k:m,k);
   V(k:m,k) = x + sign(x(1,1)) * norm(x) * eye(m+1-k,1);
   V(k:m,k) = V(k:m,k) / norm(V(k:m,k));
   A(k:m,k:n) = A(k:m,k:n) - V(k:m,k) * (V(k:m,k)' * A(k:m,k:n) * 2);
end

% Create reduced QR
hatR = A(1:n,1:n); % nxn diagonal
hatQ = eye(m,n);
% Compute the first n columns of Q
for j = 1:n
    for k = j:-1:1
       hatQ(k:m,j) = hatQ(k:m,j) - V(k:m,k) *(V(k:m,k)' * hatQ(k:m,j) * 2); 
    end
end

end

