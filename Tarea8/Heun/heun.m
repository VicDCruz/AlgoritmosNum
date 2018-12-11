function [x, yNew] = heun(x, y, h, dy)
%% Realiza un solo paso con el método de Euler
    dydx = dervs(x, y, dy);
    yEuler = y + dydx * h;
    yNew = y + (dydx + dervs(x + h, yEuler, dy)) * h / 2;
    x = x + h;
end

