function [ T ] = lanczos( A, b, k )
% Compute tridiagonal matrix T similar to A using k steps of lanczos 
% algorithm. Assume A is mxm, b is mx1 nonzero, and k is a positive 
% integer.

[m n] = size(A);
T = zeros(k, k);
Q = zeros(m, k+1);
v = zeros(m,1);

% First step: compute initial entries alpha and beta
Q(1:m,1) = (1/norm(b)) * b;
v = A * Q(1:m,1);
alpha = Q(1:m,1)' * v;
v = v - alpha * Q(1:m,1);
beta = norm(v);
T(1,1) = alpha;
T(1,2) = beta;
T(2,1) = beta;
if beta == 0
    return
end
Q(1:m,2) = v/beta;

% Inner loop
for j = 2:k-1
   v = A * Q(1:m,j) - beta * Q(1:m,j-1);
   alpha = Q(1:m,j)' * v;
   v = v - alpha * Q(1:m,j);
   beta = norm(v);
   T(j,j) = alpha;
   T(j,j+1) = beta;
   T(j+1,j) = beta;
   if beta == 0
       return
   end
   Q(1:m,j+1) = v/beta;
end

% On final step, there is no need to compute beta
v = A * Q(1:m,k) - beta * Q(1:m,k-1);
alpha = Q(1:m,k)' * v;
v = v - alpha * Q(1:m,k);
T(k,k) = alpha;

end

