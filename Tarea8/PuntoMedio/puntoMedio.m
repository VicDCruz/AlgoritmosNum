function [x, yNew] = puntoMedio(x, y, h, dy)
%% Realiza un solo paso con el método de Euler
    dydx = dervs(x, y, dy);
    yNew = y + dydx * h / 2;
    x = x + h;
end

