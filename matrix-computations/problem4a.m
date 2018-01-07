function [] = problem4a()
% Math 551, HW6 #4a

% Create 4x4 tridiagonal matrix T with 2 on main diagonal and -1 on 
% super/subdiagonals
T = zeros(4,4);
T(1,1) = 2;
for j = 2:4
   T(j,j) = 2;
   T(j,j-1) = -1;
   T(j-1,j) = -1;
end

% 40 iterations of QR algorithm
for n = 1:40
   [Q,R] = qr(T);
   T = R*Q;
   if rem(n,10) == 0
       disp(['After iteration ' int2str(n)]);
       T
   end
end

disp('Known eigenvalues:');
for j=1:4
   lambda = 4 * (sin (j * pi / 10));
   disp(lambda);
end

