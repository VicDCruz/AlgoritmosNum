syms x y
r1 = 2;
r2 = 3;
x11 = 1;
y12 = 1;
x21 = 2;
y22 = 3;
find = @(x) (sqrt(2^2 - (x - 1^2)) + 1) - (-sqrt(3^2 - (x - 1)^2) + 3);
x1 = raizPorNewton(find, -0.1, 0.001, 1000)