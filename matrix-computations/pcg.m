function [ x ] = pcg( A, b, M, k )
% Compute solution to the system Ax = b using k steps of PCG algorithm.
% Assume A is mxm, b is mx1 nonzero, and k is a positive integer.
% Assume M is mxm matrix used as a preconditioner.

[m n] = size(A);
x = zeros(m,1);
r = b;
z = M\r;
p = z;

for n = 1:k
   if norm(r) == 0
       return
   end
   alpha = (z'*r) / (p'*A*p);
   x = x + alpha * p;
   next_r = r - alpha * A * p;
   next_z = M \ next_r;
   beta = (next_z'*next_r) / (z'*r);
   r = next_r;
   z = next_z;
   p = z + beta * p;
   
   error = norm(ones(m,1) - x);
   disp(['After iteration ', int2str(n)]);
   error
end

end

