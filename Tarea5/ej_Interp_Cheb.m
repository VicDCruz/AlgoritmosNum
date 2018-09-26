nPoints=11;
x=linspace(-1,1,nPoints);
y=1./(25*x.^2+1);

T=matCoefCheb(nPoints-1);
A=evalCheb(T,x);
A=A';
c=inv(A)*y';

xqc=linspace(-1,1,200)';
fx=1./(25*xqc.^2+1);

yCheb=zeros(length(xqc),1);

for k=1:length(xqc)
    t_en_x=evalCheb(T,xqc(k));
    yCheb(k)=t_en_x'*c;
end 

%comparamos con Lagrange
yLag=zeros(length(xqc),1);
for k=1:length(xqc);
    yLag(k)=interp_Lagrange(x,y,xqc(k));
end

figure()
plot(xqc,fx,'r')
hold on
plot(x,y,'ro','MarkerSize',12)
plot(xqc,yCheb,'k--')
plot(xqc,yLag,'m-.')
legend('fx','pts Interp','Chebyshev','Lagrange')

figure()
plot(xqc,abs(fx-yCheb),'ro')
hold on
plot(xqc,abs(fx-yLag),'bs')
legend('Err_Cheb','Err_Lagr')
xlabel('x')
ylabel('1/(1+25x^2)')