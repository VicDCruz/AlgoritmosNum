xi = 0;
xf = 4;
dx = 0.001;
xout = 1;
order = 4;

% cond = [4, 6];
% dy = {@(x,y1,y2) - 0.5 * y1, @(x,y1,y2) 4 - 0.3 * y2 - 0.1 * y1};
n = max(size(cond));
%% Llamando al método
[xP, yP] = mainRungeKutta(cond, n, dy, xi, xf, dx, xout);