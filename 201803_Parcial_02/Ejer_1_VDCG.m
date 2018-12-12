syms x y
r1 = 2;
r2 = 3;
x11 = 1;
y12 = 1;
x21 = 2;
y22 = 3;
y = @(x) sqrt(4-(x-1)^2)+1
find = @(x) ((x-2)^2+(sqrt(4-(x-1)^2)+1-3)^2-9);
x1 = raizPorNewton(find, -10, 0.001, 1000)
y1 = y(x1)
y = @(x) -sqrt(4-(x-1)^2)+1
find = @(x) ((x-2)^2+(-sqrt(4-(x-1)^2)+1-3)^2-9);
x2 = raizPorNewton(find, -10, 0.001, 1000)
y2 = y(x2)