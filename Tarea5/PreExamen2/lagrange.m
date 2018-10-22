function L = lagrange(x, f)
%LAGRANGE Return a symbolic function
%   Get polynomial at those points
    syms xL
    n = max(size(x));
    L = 0;
    for i = 1:n
        newL = 1;
        for j = 1:n
            if j ~= i
                newL = newL * (xL - x(j)) / (x(i) - x(j));
            end
        end
        L = L + f(i) * newL;
    end
end

