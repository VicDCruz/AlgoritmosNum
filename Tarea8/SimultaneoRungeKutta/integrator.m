function [xP, yP, m] = integrator(n, m, xP, yP, h, xEnd, dy)
%% Calcular pasos m�s peque�os
    x = xP(m);
    y = yP(:, m);
    while x < xEnd
        if (xEnd - x) < h
            h = xEnd - x;
        end
        [xNew, yNew] = rungeKutta(n, x, y, h, dy, 4);
        m = m + 1;
        yP(:, m) = yNew;
        xP(m) = xNew;
        x = xNew;
        y = yNew;
    end
end

