function mmultTest ()
% Test matrix multiplication

A = [0 1; 1 0];
B = sqrt(2)/2 * [1 -1 0; -1 1 -1; 0 -1 1];
C = [1 2; 3 4];
D = eye(2);
E = rand(3);
E = 2 * (E - 1);
F = eye(3);

disp(mmult0(C,D,A));
disp(mmult4(C,D,A));

disp(mmult0(B,E,F));
disp(mmult4(B,E,F));

end