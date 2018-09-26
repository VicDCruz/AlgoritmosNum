xValores = linspace(1, 2.2);
yValores = zeros(length(xValores), 1);

x = [1 1.3 1.6 1.9 2.2];

y = [0.1411 -0.6878 -0.9962 -0.5507 0.3115];

for t = 1:length(xValores)
    yValores(t) = interpLagrange(x, y, xValores(t));
end

y2 = interpLagrange(x, y, xValores);

plot(xValores, yValores, 'ro');
hold on;
plot(xValores, y2, 'bx');