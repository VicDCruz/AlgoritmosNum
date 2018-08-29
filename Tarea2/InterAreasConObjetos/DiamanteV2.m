classdef DiamanteV2 < Figura2D
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Triangulo1
        Triangulo2
        TrianguloBase % Triangulo equilatero viendo hacia abajo
    end
    
    methods
        function obj = DiamanteV2(x, a, b)
            %DIAMANTEV2 Constructor
            if nargin == 0
                x = [0; 0];
                a = 1;
                b = 1;
            end
            alturaBase = (x(2) - (b / 2)) + (sqrt(3) * a / 2);
            obj.TrianguloBase = Triangulo(...
                [x(1) - (a / 2); alturaBase],...
                [x(1) + (a / 2); alturaBase],...
                [x(1); x(2) - (b / 2)]);
            obj.Triangulo1 = Triangulo(...
                [x(1) - (a / 2); alturaBase],...
                [x(1) - (a / 4); x(2) + (b / 2)],...
                [x(1) + (a / 4); x(2) + (b / 2)]);
            obj.Triangulo2 = Triangulo(...
                [x(1) - (a / 4); x(2) + (b / 2)],...
                [x(1) + a; alturaBase],...
                [x(1) + (a / 4); x(2) + (b / 2)]);
        end
        
        function output = contiene(obj,p)
            if nargin == 0
                p = [0; 0];
            end
            contieneT1 = obj.Triangulo1.contiene(p);
            contieneT2 = obj.Triangulo2.contiene(p);
            contieneTBase = obj.TrianguloBase.contiene(p);
            output = contieneT1 | contieneT2 | contieneTBase;
        end
        
        function output = valoresExtremos(obj)
            vEBase = obj.TrianguloBase.valoresExtremos();
            xMin = vEBase(1, 1);
            yMin = vEBase(2, 1);
            xMax = vEBase(1, 2);
            vET1 = obj.Triangulo1.valoresExtremos();
            yMax = vET1(2,2);
            output = [xMin, xMax; yMin, yMax];
        end
    end
end

