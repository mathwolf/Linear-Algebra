function [x] = backsub (U, b)
% Solve a system by back substitution

% Assume U is n x n upper triangular and nonsingular,
% b is n x 1

% Output is an n x 1 solution vector
[n, k] = size(U);
x = zeros(n,1);

for i = n:-1:1
    x(i) = b(i);
   for j = n:-1:i+1
       x(i) = x(i) - U(i,j) * x(j);
   end
   x(i) = x(i) / U(i,i);
end

end

