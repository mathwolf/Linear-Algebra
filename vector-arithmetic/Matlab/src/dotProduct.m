function c = dotProduct( x, y )
% Dot product of two real vectors
% GVL Algorithm 1.1.1

% Input: real-valued vectors x, y that have the same length
% Output: their scalar dot product

n = size(x);
n = n(1);

c = 0;
for i = 1:n
    c = c + x(i) * y(i);
end
end

