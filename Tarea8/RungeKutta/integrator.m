function [xP, yP, m] = integrator(m, xP, yP, h, xEnd, dy, order)
%% Calcular pasos m�s peque�os
    x = xP(m);
    y = yP(m);
    while x < xEnd
        if (xEnd - x) < h
            h = xEnd - x;
        end
        [xNew, yNew] = rungeKutta(x, y, h, dy, order);
        m = m + 1;
        yP(m) = yNew;
        xP(m) = xNew;
        x = xNew;
        y = yNew;
    end
end

