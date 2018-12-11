xi = 0;
xf = 4;
dx = 0.5;
xout = 1;
order = 4;
syms y(x)
%% Ejemplo 1
edo = diff(y) == 4 * exp(0.8 * x) - 0.5 * y;
cond = y(0) == 2;
dy = @(x,y) 4 * exp(0.8 * x) - 0.5 * y;
%% Ejemplo 2
% edo = diff(y) == -2*x^3 + 12*x^2 - 20*x + 8.5;
% cond = y(0) == 1;
% dy = @(x, y) -2*x^3 + 12*x^2 - 20*x + 8.5;
%% Llamando al método
[xP, yP] = mainRungeKutta(dy, edo, cond, xi, xf, dx, xout, order);