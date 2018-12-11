xi = 0;
xf = 2;
dx = 0.5;
xout = 1;
order = 4;
syms y1(x) y2(x)
%% Ejemplo 1
edo = [diff(y1) == -0.5*y1, diff(y2) == 4 - 0.3 * y2 - 0.1 * y1];
cond = [y1(0) == 4, y2(0) == 6];
dy = {@(x,y1,y2) - 0.5 * y1, @(x,y1,y2) 4 - 0.3 * y2 - 0.1 * y1};
%% Llamando al método
[xP, yP] = mainRungeKutta(edo, cond, 2, dy, xi, xf, dx, xout);