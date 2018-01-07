function[A,B,C] = abc(n)
% Create tridiagonal matrix T
T = zeros(n,n);
for i = 1:n
    for j = 1:n
        if i == j
            T(i,j) = 2;
        elseif abs(i-j) == 1
            T(i,j) = 1;
    end
end

% Create matrix X
X = zeros(n,n);
for i = 1:n
   for j = 1:n
        X(i,j) = sqrt(2/(n+1)) * sin(i*j*pi/(n+1));
   end
end

% Calculate A, B and C
A = X - transpose(X); 
B = X * X;
C = X * T * X;
end

