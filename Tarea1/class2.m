%% Ver con una distribución Normal
W = 50;
Z = zeros(100,1);
for r = 1:100, Z(r) = mean(randn(W,1)); end
plot(Z, '+')
sdTZ = std(Z)
sdTeorica = 1 / sqrt(W)
hist(Z)