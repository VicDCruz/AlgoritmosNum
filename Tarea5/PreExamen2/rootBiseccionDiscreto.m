function xRoot = rootBiseccionDiscreto(x, f)
%ROOTBISECCION Summary of this function goes here
%   Detailed explanation goes here
    xInf = 1;
    xSup = max(size(x));
    xRoot = (xInf + xSup) / 2 - mod((xInf + xSup) / 2, 1);
    contIter = 0;
    maxIter = 50;
    while f(xInf)*f(xRoot) ~= 0 && contIter < maxIter
        if f(xInf)*f(xRoot) < 0
            xSup = xRoot;
            xRoot = (xInf + xSup) / 2 - mod((xInf + xSup) / 2, 1);
        elseif f(xInf)*f(xRoot) > 0
            xInf = xRoot;
            xRoot = (xInf + xSup) / 2 - mod((xInf + xSup) / 2, 1);
        end
        contIter = contIter + 1;
    end
end

