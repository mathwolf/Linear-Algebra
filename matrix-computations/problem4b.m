function [] = problem4b()
% Math 551, HW6 #4b

% Create 4x4 tridiagonal matrix T with 2 on main diagonal and -1 on 
% super/subdiagonals
T = zeros(4,4);
T(1,1) = 2;
for j = 2:4
   T(j,j) = 2;
   T(j,j-1) = -1;
   T(j-1,j) = -1;
end

% 4 iterations of QR algorithm with Wilkinson shifts
for n = 1:4
    % Compute Wilkinson shift
    % Get entries from bottom 2x2 block of T
    alpha_3 = T(3,3);
    alpha_4 = T(4,4);
    beta_3 = T(3,4);
    % Compute eigenvalues of this block
    z_plus = (alpha_3 + alpha_4)/2 + ...
        sqrt( ((alpha_3 - alpha_4)/2)^2 + beta_3^2 );
    z_minus = (alpha_3 + alpha_4)/2 - ...
        sqrt( ((alpha_3 - alpha_4)/2)^2 + beta_3^2 );
    % Shift is eigenvalue closest to alpha_3
    if alpha_3 < alpha_4
        mu = z_plus;
    else
        mu = z_minus;
    end
    
   [Q,R] = qr(T - mu*eye(4));
   T = R*Q + mu*eye(4);
   disp(['After iteration ' int2str(n)]);
   T
   
end

disp('Known eigenvalues:');
for j=1:4
   lambda = 4 * (sin (j * pi / 10))^2;
   disp(lambda);
end

