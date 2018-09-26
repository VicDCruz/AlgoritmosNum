f = @(x) 1 ./ (1 + 25 * x .^ 2);
xc = linspace(-1, 1, 200); % X continua
yc = f(xc);
plot(xc, yc, 'b-');

xd = linspace(-1, 1, 21); % X discreto
yd = f(xd);
hold on
plot(xd, yd, 'bd');

% Obtener la funcion con xd, yd
yL = interpLagrange(xd, yd, xc);
%plot(xc, yL, 'r--');

nodT = raicesCheb(21);
yNod = f(nodT);
yL2 = interpLagrange(nodT, yNod, xc);
plot(nodT, yNod, 'ms');
plot(xc, yL2, 'm--');

legend('orig', 'puntos', 'pt', 'Lag2');