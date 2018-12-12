%% Creando puntos random
datosPeces = readtable('datosPeces.csv');
x1 = datosPeces.edad;
x2 = datosPeces.temperatura;
y = datosPeces.longitud;

syms x x3 x4
close all;
hold on;
poly = sym(regresion(x1, y, 1));
poly = subs(poly, x, x3);
poly = poly + sym(regresion(x2, y, 1));
poly = subs(poly, x, x4);
poly = matlabFunction(poly)
plot3(x1, x2, poly(x1,x2))
hold off;