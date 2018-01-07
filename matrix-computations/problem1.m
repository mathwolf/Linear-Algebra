function [] = problem1()
% Solution for Math 551, HW 6 #1

% Suppress warnings regarding ill-conditioned matrices.
warning('off','MATLAB:nearlySingularMatrix');

% Create 6x6 tridiagonal matrix T with 2 on main diagonal and -1 on 
% super/subdiagonal
T = zeros(6,6);
T(1,1) = 2;
for j = 2:6
   T(j,j) = 2;
   T(j,j-1) = -1;
   T(j-1,j) = -1;
end

% Find one eigenvector for each of the six given eigenvalues
for j = 1:6
    mu = 4 * (sin ((j*pi)/14) )^2;    % use current eigenvalue as shift
    v0 = rand(6,1);                       
    v0 = v0 / norm(v0);               % normalize initial vector
    w = (T - mu*eye(6)) \ v0;
    v1 = w/norm(w);
    % Display eigenvector
    output = strcat('Calculated eigenvector v',int2str(j), ':');
    disp(output);
    disp(v1);
    
    % Compute exact eigenvector
    exact = zeros(6,1);
    for i = 1:6
        exact(i) = sqrt(2/7) * sin(i * j * pi / 7);
    end
    
    % Compare calculated and exact answers
    disp('Norm of difference between calculated and exact eigenvectors:');
    diff = norm(v1 - exact);
    disp(diff);
    disp('Norm of sum of calculated and exact eigenvectors:');
    sum = norm(v1 + exact);
    disp(sum);
end

end

