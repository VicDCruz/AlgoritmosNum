function dydx = dervs(x, y, dy, n)
%% Calcula el valor de la derivada, según un criterio dado
    dydx = zeros(n, 1);
    for i = 1:n
        dyTmp = dy{i};
        yArg = mat2cell(y',1,ones(1,numel(y')));
        dydx(i) = dyTmp(x, yArg{:});
    end
end

