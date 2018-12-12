xi = 0;
xf = 4;
dx = 0.001;
xout = 1;
order = 4;
syms y1(x) y2(x)
%% Ejemplo 1
% cond = [4, 6];
% dy = {@(x,y1,y2) - 0.5 * y1, @(x,y1,y2) 4 - 0.3 * y2 - 0.1 * y1};
%% Ejemplo 2 (Pendulos)
cond = [pi/4, 0, pi/4, 0];
dy = {@(x, y1, y2, y3, y4) y2, ...
        @(x, y1, y2, y3, y4) -16.1 * y1, ...
        @(x, y1, y2, y3, y4) y4, ...
        @(x, y1, y2, y3, y4) -16.1 * sin(y3)};
n = max(size(cond));
%% Llamando al método
[xP, yP] = mainRungeKutta(cond, n, dy, xi, xf, dx, xout);