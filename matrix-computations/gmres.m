function [ x ] = gmres( A, b, k )
% Compute solution to the system Ax = b using k steps of GMRES algorithm.
% Assume A is mxm, b is mx1 nonzero, and k is a positive integer.

[m n] = size(A);
H = zeros(k+1, k);
Q = zeros(m, k+1);

Q(1:m,1) = (1/norm(b)) * b;

for n = 1:k
    
   % Perform Arnoldi iteration step number n
   v = A*Q(1:m,n);
   for i = 1:n
      H(i,n) = Q(1:m,i)'*v;
      v = v - H(i,n)*Q(1:m,i);
   end
   H(n+1,n) = norm(v); 
   if H(n+1,n) == 0    
      e1 = zeros(n,1);
      e1(1,1) = 1;
      y = H(1:n,1:n)\(norm(b)*e1);
      x = Q(1:m,1:n)*y; % exact solution
      return
   end
   
   % Solve LS problem for H~ using QR factorization
   e1 = zeros(n+1,1);
   e1(1,1) = 1;
   [hatQ, hatR] = qr(H(1:n+1,1:n), 0);
   y = hatR\(norm(b)*hatQ'*e1);
   x = Q(1:m,1:n)*y;
   Q(1:m,n+1) = v/H(n+1,n);
   
   % Display error every fifth iteration
   if mod(n,5) == 0
      error = norm(ones(m,1) - x);
      disp(['After iteration ', int2str(n)]);
      error
   end
end

end

