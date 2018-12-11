xi = 0;
yi = 1;
xf = 4;
dx = 0.001;
xout = 1;
% syms x
% dy(x) = -2*x^3 + 12*x^2 - 20*x + 8.5;
% [xP, yP] = mainEuler(dy, yi, xi, xf, dx, xout);
syms y(x)
edo = diff(y) == -2*x^3 + 12*x^2 - 20*x + 8.5;
cond = y(0) == 1;
dy = @(x, y) -2*x^3 + 12*x^2 - 20*x + 8.5;
[xP, yP] = mainEuler(dy, edo, cond, xi, xf, dx, xout);