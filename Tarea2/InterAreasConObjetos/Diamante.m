classdef Diamante < Figura2D
    %DIAMANTE Figura clásica de un diamante
    %   La composición de un triángulo equilatero orientado hacia abajo
    %   y, encima, un trapecio canónico
    
    properties
        xMin
        xMax
        yMin
        yMax
        baseTrapecio % ptos que forman la base inf
        tapaTrapecio % ptos que forman la base sup
        puntaDiamante
    end
    
    methods
        function obj = Diamante(x, a, b)
            %DIAMANTE Instancia de la clase con el centro y las medidas que
            %ocupara la figura
            %   Detailed explanation goes here
            if nargin == 0
                x = [0; 0];
                a = 1;
                b = 1;
            end
            fig2d_args{1} = x;
            obj = obj@Figura2D(fig2d_args{:});
            obj.xMin = x(1) - a/2;
            obj.xMax = x(1) + a/2;
            obj.yMin = x(2) - b/2;
            obj.yMax = x(2) + b/2;
            obj.baseTrapecio = [obj.xMin,                   obj.xMax;...
                                obj.yMin + (sqrt(3) * a/2), obj.yMin + (sqrt(3) * a/2)];
            obj.tapaTrapecio = [x(1) - a/4,	x(1) + a/4;... % La mitad la base inferior
                                obj.yMax,   obj.yMax];
            obj.puntaDiamante = [x(1); obj.yMin];
        end
        
        function estaAdentro = contiene(obj, p)
            %METODO1 Saber si un punto está dentro del diamante
            if nargin == 0
                p = [0; 0];
            end
            %d = p - obj.centro;
            v0 = obj.baseTrapecio(:,1); v = p;
            v1 = obj.baseTrapecio(:,2) - v0; v2 = obj.puntaDiamante - v0;
            a = ((v2(2) * (v(1) - v0(1))) - v2(2) * (v(2) - v0(2))) / (v1(1)*v2(2) - v1(2)*v2(1));
            b = -((v1(2) * (v(1) - v0(1))) - v1(2) * (v(2) - v0(2))) / (v1(1)*v2(2) - v1(2)*v2(1));
            v1 = obj.tapaTrapecio(:,1) - v0; v2 = obj.tapaTrapecio(:,2) - v0;
            c = ((v2(2) * (v(1) - v0(1))) - v2(2) * (v(2) - v0(2))) / (v1(1)*v2(2) - v1(2)*v2(1));
            d = -((v1(2) * (v(1) - v0(1))) - v1(2) * (v(2) - v0(2))) / (v1(1)*v2(2) - v1(2)*v2(1));
            v1 = obj.tapaTrapecio(:,2) - v0; v2 = obj.baseTrapecio(:,2) - v0;
            e = ((v2(2) * (v(1) - v0(1))) - v2(2) * (v(2) - v0(2))) / (v1(1)*v2(2) - v1(2)*v2(1));
            f = -((v1(2) * (v(1) - v0(1))) - v1(2) * (v(2) - v0(2))) / (v1(1)*v2(2) - v1(2)*v2(1));
            estaAdentro = (a>=0 & b>=0 & a+b<1) |...
                (c>=0 & d>=0 & c+d<1) |...
                (e>=0 & f>=0 & e+f<1);
        end
        
        function output = valoresExtremos(obj)
            output = [obj.xMin, obj.yMin; obj.xMax, obj.yMax];
        end
    end
end

