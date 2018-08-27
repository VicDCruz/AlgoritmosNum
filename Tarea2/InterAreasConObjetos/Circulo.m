classdef Circulo < Figura2D
   properties
     radio  
   end
   methods 
       function obj = Circulo(x,r) % Constructor
           if nargin == 0 % Preguntar # de argumentos
             fig2d_args{1} = [0.0;0.0]; % Fig. en 2D
             c = 1.0;
           else
             fig2d_args{1} = x;
             c = r;
           end
           % Llamar super métodos en subclases de objetos (V.C.)
           obj@Figura2D(fig2d_args{:}); % Poner la figura al objeto
           obj.radio  = c;
       end
       function bln = contiene(obj,p)
         if nargin == 0
           pv = [0.0;0.0];  
         else
           pv = p;  
         end    
         d = pv - obj.centro;
         bln = (d' * d) <= obj.radio^2;
       end
       function xtam = valoresExtremos(obj) % Decir con que obj trabajar
          xtam = [[obj.centro(1)-obj.radio;obj.centro(2)-obj.radio], ...
                  [obj.centro(1)+obj.radio;obj.centro(2)+obj.radio]];
       end
   end
end