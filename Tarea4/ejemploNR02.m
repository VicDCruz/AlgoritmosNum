a = 12.5577822;
b = 0.0018626;
P = 65000;
T = -40 + 273.15;
R = 0.518;

syms v
f = sym(-P + (R*T)/(v-b) -a/(v*(v+b)*sqrt(T)));
df = diff(f);

iMax = 100;
tol = 1e-7;
x0 = 2e-3;

rSol = zeros(iMax, 1);
rSol(1) = x0;
nIter = 1;
eAbs = 1000;
eAbsV = zeros(iMax, 1);
while (nIter<iMax) && (eAbs>tol)
    razon = double(subs(f,x0))/double(subs(df, x0));
    xn = x0-razon;
    rSol(nIter+1) = xn;
    eAbs = double(abs(xn-x0));
    eAbsV(nIter) = eAbs;
    x0 = xn;
    nIter = nIter + 1;
end
fprintf('La raiz es: %.9f [m3/kg]\n', rSol(nIter))
plot(1:nIter-1,eAbsV(1:nIter-1))
% valVol = linspace(-1,1,5e3);
% g = (R*T)./(valVol-b) -a/(v*(v+b)*sqrt(T));
% 
% figure
% plot(valVol, g, 'r--')
% xlabel('vol especifico []')
% ylabel('presion [kPa]')