classdef Funcion < Figura2D
    properties
        funcion
        yMin
        yMax
        xMin
        xMax
    end
    
    methods
        function obj = Funcion(funcion, yMax, a, b)
            if nargin == 0
                obj.funcion = @(x) x;
                obj.yMin = 0;
                obj.yMax = 1;
                obj.xMin = 0;
                obj.xMax = 1;
            else
                obj.funcion = funcion;
                obj.yMin = 0;
                obj.yMax = yMax;
                obj.xMin = a;
                obj.xMax = b;
            end
        end
        
        function output = contiene(obj,p)
            if nargin == 0
                p = [0;0];
            end
            output = obj.funcion(p(1)) >= p(2) &...
                obj.xMin <= p(1) & p(1) <= obj.xMax;
        end
        
        function output = valoresExtremos(obj)
            output = [obj.xMin, obj.xMax; obj.yMin, obj.yMax];
        end
    end
end

