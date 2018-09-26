function rCheb = raicesCheb( n )
%raicesCheb entrega un vector con las raices del polinomio de Chebyshev de
%grado n. El valor de n puede comenzar de 0, ya que T_0(x)=1
%   Entradas:   
%               n orden del polinomio de Chebyshev
%   Salidas:
%               rCheb, vector con las raices del polinomio de Cheb. de
%               grado n
    if n==0
        rCheb=[]; %el polinomio de grado 0, es T_0(x)=1, sin raices
    else    
        rCheb = cos( (2*(1:n)-1)/(2*n) *pi);
    end
end

