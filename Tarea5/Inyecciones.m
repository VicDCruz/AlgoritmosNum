%% INYECCIONES
cMax = 0.05;
A = cMax / (t * exp(-t / 5));
c = (@t) A * t * exp(-t / 5);