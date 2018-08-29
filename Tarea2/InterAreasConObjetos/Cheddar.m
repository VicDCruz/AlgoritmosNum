classdef Cheddar < Figura2D
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        RectanguloCanonico
        Circulo
    end
    
    methods
        function obj = Cheddar(x, a, b, r)
            %CHIPOTE Construir una instacia a la clase
            %   x es la coordenada, a es lado horizontal y b es lado
            %   vertical del rectangulo y r es el radio del círculo
            if nargin == 0
                x = [0; 0];
                a = 1;
                b = 1;
                r = 1;
            end
            obj.RectanguloCanonico = RectanguloCanonico(x, a, b);
            obj.Circulo = Circulo(x, r);
        end
        
        function output = contiene(obj, p)
            %CONTIENE Ver si un punto está o no dentro de la figura
            %   Checar que ambas condiciones de la figura se cumplan
            output = ~obj.Circulo.contiene(p) & obj.RectanguloCanonico.contiene(p);
        end
        
        function output = valoresExtremos(obj)
            extremosCirculo = obj.Circulo.valoresExtremos();
            extremosRect = obj.RectanguloCanonico.valoresExtremos();
            xMin = min(extremosCirculo(1, 1), extremosRect(1, 1));
            yMin = min(extremosCirculo(2, 1), extremosRect(2, 1));
            xMax = max(extremosCirculo(1, 2), extremosRect(1, 2));
            yMax = max(extremosCirculo(2, 2), extremosRect(2, 2));
            output = [xMin, xMax; yMin, yMax];
        end
    end
end

