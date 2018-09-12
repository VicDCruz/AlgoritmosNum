function [ r,nIter ] = raizBiseccion( f, xMin, xMax, tol )
%raizBiseccion es una funcion que regresa una la raiz r de la funcion f
%dentro del intervalo [xMin,xMax] con una tolerancia tol
%   f es la funcion a la cual se quiere encontrar su raiz
%   xMin es la cota minima del intervalo
%   xMax es la cota maxima del intervalo
%   tol es la tolerancia o error permitido
nIter=0;
r=NaN;
errorR=1e6;
while errorR>tol
    puntoMedio=xMin+(xMax-xMin)/2;
    fpM=f(puntoMedio);
    if sign(f(xMin))==sign(fpM)
        xMin=puntoMedio;
    else
        xMax=puntoMedio;
    end
    errorR=abs(xMax-xMin);
    r=puntoMedio;
    nIter=nIter+1;
end

end

