% tstFiguraCompuesta
figs    = {};
figs{1} = FiguraFuncion(@(x)exp(-(((x-2)./0.75).^2)) + exp(-(((x-4)./0.75).^2)),0.0,6.0,2.0);
% figs{2} = Circulo([3;0.5],1);
figs{2} = ElipseCanonica([3;0.5], 3, 0.5);
% ===Generando ret�ngulos (inciso 5)===
figs{3} = RectanguloCanonico([1;0.5], 1, 1/2);
figs{4} = RectanguloCanonico([3;0.5], 1, 1/2);
figs{5} = RectanguloCanonico([5;0.5], 1, 1/2);
% =====================================
clf
hold on
figs{1}.dibuja();
figs{2}.dibuja();
figs{3}.dibuja();
figs{4}.dibuja();
figs{5}.dibuja();
% return
pause(1)
% inter_cta = zeros(1,4); % Para inciso 3 y 4
% inter_cta(3) = 1; % Para inciso 3
% inter_cta(2) = 1; % Para inciso 4
% inter_cta(3) = 2; % Para inciso 4
% ===INCISO 5===
inter_cta = zeros(1,32);
inter_cta(3) = 2;
inter_cta(6) = 3;
inter_cta(7) = 2;
inter_cta(10) = 1;
inter_cta(11) = 2;
inter_cta(18) = 4;
inter_cta(19) = 2;
% ==============
fc = FiguraCompuesta(figs,inter_cta);
vxtrms = fc.valoresExtremos();
dx = vxtrms(1,2) - vxtrms(1,1);
dy = vxtrms(2,2) - vxtrms(2,1);
dxdy = dx * dy;
M = 100;
N = 50;
K = 100;
A = zeros(M,N);
tic
parfor n = 1:N  % para cada columna
    k = K * n;
    for m = 1:M
      puntos = [vxtrms(1,1) + dx * rand(1,k); vxtrms(2,1) + dy * rand(1,k)];
      cuenta = 0;
      for w = 1:k
       cuenta = cuenta + fc.contiene(puntos(:,w));   
      end
      proporcion = cuenta / k;
      A(m,n) = dxdy * proporcion;
    end   
end
toc

mA = mean(A);
sA = std(A);
clf
hold on
plot(A','.')

plot((1:N),mA,'o')
plot((1:N),mA + sA,'+')
plot((1:N),mA - sA,'+')

D=zeros(1,N);
for n=1:N
    D(n)=sum((mA(n)-sA(n)<=A(:,n)).*(A(:,n)<=mA(n)+sA(n)));
end
porcEnsayos = D/M;