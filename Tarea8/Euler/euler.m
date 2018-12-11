function [x, yNew] = euler(x, y, h, dy)
%% Realiza un solo paso con el método de Euler
    dydx = dervs(x, y, dy);
    yNew = y + dydx * h;
    x = x + h;
end

