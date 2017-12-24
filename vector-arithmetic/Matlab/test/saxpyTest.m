function saxpyTest ()
% Test saxpy operation

x = [3; 4];
y = sqrt(2)/2 * [1; 1];

disp(saxpy(1,x,x));
disp(saxpy(2,y,y));
disp(saxpy(3,x,y));
end