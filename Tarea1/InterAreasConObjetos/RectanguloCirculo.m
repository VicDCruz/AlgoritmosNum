classdef RectanguloCirculo < Figura2D
    properties
        radio
        semiLado_hor
        semiLado_ver
        xmax
        xmin
        ymax
        ymin
    end
    methods
        function obj = RectanguloCirculo(x, r, a, b)
            if nargin < 4
                fig2d_args{1} = [0.0;0.0]; % Fig. en 2D
                c = 1.0;
                sL_h = 1.0;
                sL_v = 1.0
            else
                fig2d_args{1} = x;
                c = r;
                sL_h = a;
                sL_v = b;
            end
            % Llamar super métodos en subclases de objetos (V.C.)
            obj@Figura2D(fig2d_args{:}); % Poner la figura al objeto
            obj.radio  = c;
            obj.semiLado_hor = sL_h;
            obj.semiLado_ver = sL_v;
            obj.xmin = obj.centro(1) - sL_h;
            obj.xmax = obj.centro(1) + sL_h;
            obj.ymin = obj.centro(2) - sL_v;
            obj.ymax = obj.centro(2) + sL_v;
        end
        function bln = contiene(obj, p)
            if nargin == 0
                pv = [0.0;0.0];  
            else
                pv = p;  
            end    
            d = pv - obj.centro;
            bln = (d' * d) <= obj.radio^2 & ...
                pv(1) >= obj.xmin & ...
                pv(1) <= obj.xmax & ...
                pv(2) >= obj.ymin & ...
                pv(2) <= obj.ymax;
        end
    end
end