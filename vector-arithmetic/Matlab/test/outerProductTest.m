function outerProductTest ()
% Test outer product

A = [0 -1; 1 0];
x = [3; 4];
z = [0; 0];

disp(outerProduct2(A,x,z));

A = [1 -1; 1 1];
x = [3; 4];
y = sqrt(2)/2 * [1; 1];
z = [0; 0];

disp(outerProduct2(A,y,x));

end