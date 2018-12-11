function [x, yNew] = rungeKutta(x, y, h, dy, order)
%% Realiza un solo paso con el método de Runge Kutta
    if order == 2
        k1 = dervs(x, y, dy);
        k2 = dervs(x + 3 * h / 4, y + 3 * k1 * h / 4, dy);
        increment = k1 / 3 + 2 * k2 / 3;
    elseif order == 3
        k1 = dervs(x, y, dy);
        k2 = dervs(x + h / 2, y + k1 * h / 2, dy);
        k3 = dervs(x + h, y - k1 * h + 2 * k2 * h, dy);
        increment = (k1 + 4 * k2 + k3) / 6;
    elseif order == 4
        k1 = dervs(x, y, dy);
        k2 = dervs(x + h / 2, y + k1 * h / 2, dy);
        k3 = dervs(x + h / 2, y + k2 * h / 2, dy);
        k4 = dervs(x + h, y + k3 * h, dy);
        increment = (k1 + 2* k2 + 2 * k3 + k4) / 6;
    elseif order == 5
        k1 = dervs(x, y, dy);
        k2 = dervs(x + h / 4, y + k1 * h / 4, dy);
        k3 = dervs(x + h / 4, y + k1 * h / 8 + k2 * h / 8, dy);
        k4 = dervs(x + h / 2, y - k2 * h / 2 + k3 * h, dy);
        k5 = dervs(x + 3 * h / 4, y + 3 * k1 * h / 16 + 9 * k4 * h / 16, dy);
        k6 = dervs(x + h, y - 3 * k1 * h / 7 + ...
                            2 * k2 * h / 7 + ...
                            12 * k3 * h / 7 - ...
                            12 * k4 * h / 7 + ...
                            8 * k5 * h / 7, dy);
        increment = (7 * k1 + 32 * k3 + 12 * k4 + 32 * k5 + 7 * k6) / 90;
    else
        error('Ese orden no se programó');
    end
    yNew = y + increment * h;
    x = x + h;
end

