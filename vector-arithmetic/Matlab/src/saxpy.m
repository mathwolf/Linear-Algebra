function z = saxpy( a, x, y )
% Scalar a times vector x plus vector y
% GVL Algorithm 1.1.2

% Input:    a, a real scalar
%           x,y real vectors of the same length
% Output:   z = ax + y, a vector of the same size as x and y

n = size(x);
n = n(1);

z = zeros(n,1);
for i = 1:n
    z(i) = a * x(i) + y(i);
end
end

