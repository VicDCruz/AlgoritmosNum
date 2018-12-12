%% Obtener puntos en forma de matrix
x0 = 0;
y0 = 1;
x1 = 0.5;
y1 = 2;
x2 = 1;
y2 = 1;

m1 = (y1 - y0) / (x1 - x0);
m2 = (y1 - y2) / (x1 - x2);

polynomial = splineF([x0, x1, x2], [x0; x1; x2; x1; x2; x2], [y0; y1; y2; 0; 1; 0], [0, 0, 0, 1, 1, 2])

%% Graficar
% Puntos de las condiciones
close all;
hold on;
plot(x0, y0, 'r*');
plot(x1, y1, 'r*');
plot(x2, y2, 'r*');
minPoint = min([x0, x1, x2]); maxPoint = max([x0, x1, x2]);
pointsToGraph = linspace(minPoint * 0.50, maxPoint * 1.50);
plot(pointsToGraph, polynomial(pointsToGraph));