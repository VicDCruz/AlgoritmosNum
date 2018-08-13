M = 100; N = 20; K = 100;
A = zeros(M,N);
for n = 1:N
  k = K *n;
  for m = 1:M
    x = rand(K,1); y = rand(K,1);
    A(m,n) = sum(x.*x + y.*y <= 1) / K;
  end
end

mA = mean(A); % Mean of A
sdA = std(A); % Standard deviation of A

plot(A, '.'); hold on
plot((1:N), mA)
plot((1:N), mA + sdA)
plot((1:N), mA - sdA)
hold off
