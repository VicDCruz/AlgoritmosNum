n = 6;
k = 0 : n-1;
xk = cos(pi / 4 + k * pi / 2);
r = 8; s = 12;
Tr = cos(r * acos(xk));
Ts = cos(s * acos(xk));
polarplot(Tr, '--*')
hold on
polarplot(Ts, '-s')
hold off