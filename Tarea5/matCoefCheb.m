function C = matCoefCheb(n)
%
% matCoefCheb(n) genera los coeficientes de los polinomios de Chebyshev del
% grado 0 a n

% Entradas:     n es el grado hasta el cual se generan los polinomios de
% Chebyshev
% Salidas:      C es la matriz con los coeficientes de Chebyshev, tiene
% dimensiones (n+1,n+1), los coeficientes se acomodan en orden ascendente
%
  if n>=0
      C = zeros(n+1);
      %Definimos los coeficientes de los polinomios T0(x)=1 y T1(x)=(x)
      C(1,1) = 1;
      if n>=1
        C(2,2) = 1;
        if n>=2
            for k = 3:n+1,
                C(k,:) = 2 * ([0 C(k-1,1:n)]) - C(k-2,:);
            end    
        end
      end   
  else
      error('el grado n debe ser igual o mayor a 0');
  end    
end