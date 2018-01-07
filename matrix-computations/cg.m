function [ x ] = cg( A, b, k )
% Compute solution to the system Ax = b using k steps of CG algorithm.
% Assume A is mxm, b is mx1 nonzero, and k is a positive integer.

[m n] = size(A);
x = zeros(m,1);
r = b;
p = r;

for n = 1:k
   if norm(r) == 0
       return
   end
   alpha = (r'*r) / (p'*A*p);
   x = x + alpha * p;
   next_r = r - alpha * A * p;
   beta = (next_r'*next_r) / (r'*r);
   r = next_r;
   p = r + beta * p;
   
   if mod(n,5) == 0
      error = norm(ones(m,1) - x);
      disp(['After iteration ', int2str(n)]);
      error
   end
end

end

