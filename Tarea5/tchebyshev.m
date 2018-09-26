t1 = @(x) x;
t2 = @(x) 2*x.^2-1;
t3 = @(x) 4*x.^3-3*x;
t4 = @(x) 8*x.^4-8*x.^2+1;
t5 = @(x) 16*x.^5-20*x.^3+5*x;
x = linspace(-1, 1);
figure()
plot(x, t1(x), 'r-');
hold on
plot(x, t2(x), 'm-');
plot(x, t3(x), 'b-');
plot(x, t4(x), 'c-');
plot(x, t5(x), 'k-');