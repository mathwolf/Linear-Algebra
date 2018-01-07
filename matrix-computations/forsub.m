function [x] = forsub (L, b)
% Solve a system by forward substitution

% Assume L is n x n lower triangular and nonsingular,
% b is n x 1

% Output is an n x 1 solution vector
[n k] = size(L);
x = zeros(n,1);

for i = 1:n
    x(i) = b(i);
   for j = 1:i-1
       x(i) = x(i) - L(i,j) * x(j);
   end
   x(i) = x(i) / L(i,i);
end

end

