function xRoot = rootBiseccion(x, f)
%ROOTBISECCION Summary of this function goes here
%   Detailed explanation goes here
    xInf = x(1);
    xSup = x(max(size(x)));
    xRoot = (xInf + xSup) / 2;
    while f(xInf)*f(xRoot) ~= 0
        if f(xInf)*f(xRoot) < 0
            xSup = xRoot;
            xRoot = (xInf + xSup) / 2;
        elseif f(xInf)*f(xRoot) > 0
            xInf = xRoot;
            xRoot = (xInf + xSup) / 2;
        end
    end
end

