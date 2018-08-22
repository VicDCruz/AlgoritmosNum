function raiz = raizNewtonv0(f, x, eps)
%raizNewtonv0 Obtener numéricamente la raízde una ecuación
%   eps = epsilon
    fs = sym(f);
    fsp = diff(fs);
    fp = matlabFunction(fsp);
    xv = 2*x;
    while abs(x - xv) > eps
        xv = x;
        x = x - f(x) / fp(x);
    end
    raiz = x;
end

