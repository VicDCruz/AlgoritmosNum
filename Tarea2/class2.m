%% Handle vs SYM
f = @(x) x^2 - 5 %% Crear handle
f(3)
fs = sym(f) %% Función en simbólica
fsp = diff(fs) %% Get derivate
fp = matlabFunction(fsp) %% Transformar al hanlde
fp(3)
%% Newton's method
raizNewtonv0(f, 500, 1e-10);
raizNewtonv0(@(x) x^3, 5, 1e-10);