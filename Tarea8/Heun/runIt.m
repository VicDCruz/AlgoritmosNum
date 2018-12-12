xi = 0;
xf = 4;
dx = 0.5;
xout = 1;
order = 4;
syms y(x)
%% Ejemplo 1
cond = 2;
dy = @(x,y) 4 * exp(0.8 * x) - 0.5 * y;
%% Ejemplo 2
% cond = 1;
% dy = @(x, y) -2*x^3 + 12*x^2 - 20*x + 8.5;
%% Llamando al método
[xP, yP] = mainHeun(dy, cond, xi, xf, dx, xout);