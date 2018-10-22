syms x
altura = sym(exp(1)/100*x*exp(-x/5));
da = diff(altura);

x0 = 5;
errorA = 1e6;
iterMax =100;
tol = 1e-6;
nIter = 0;
while errorA>tol && nIter<iterMax
    razon = double(subs(altura,x0)/subs(da,x0));
    xn = x0 - razon;
    errorA = abs(xn-x0);
    nIter = nIter+1;
    x0 = xn;
end    
