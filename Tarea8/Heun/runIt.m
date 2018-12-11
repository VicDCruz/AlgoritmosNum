xi = 0;
yi = 2;
xf = 4;
dx = 0.001;
xout = 1;
syms y(x)
% edo = diff(y) == 4 * exp(0.8 * x) - 0.5 * y;
% cond = y(0) == 2;
% dy = @(x,y) 4 * exp(0.8 * x) - 0.5 * y;
edo = diff(y) == -2*x^3 + 12*x^2 - 20*x + 8.5;
cond = y(0) == 1;
dy = @(x, y) -2*x^3 + 12*x^2 - 20*x + 8.5;
[xP, yP] = mainHeun(dy, edo, cond, xi, xf, dx, xout);