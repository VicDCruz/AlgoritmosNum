classdef RectanguloCirculo < Figura2D
    %RECTANGULOCIRCULO Figura que une a ambas figruas
    %   La composición de un rectángulo canónico
    %   y un círculo, INDEPENDIENTEMENTE de su posición de ambos, pueden
    %   estar intersectándose (o no) en cualquier lugar
    properties
        radio
        semiLado_hor
        semiLado_ver
        xmax
        xmin
        ymax
        ymin
        xmaxR
        xminR
        ymaxR
        yminR
        centroCirculo
    end
    methods
        function obj = RectanguloCirculo(x1, r, x2, a, b) % x1 es el centro
            % del círculo, r es su radio, x2 es el centro del rectangulo,
            % a y b es el ancho y largo de éste.
            if nargin < 5
                fig2d_args{1} = [0.0;0.0]; % Fig. en 2D
                c = 1.0;
                sL_h = 1.0;
                sL_v = 1.0;
                x1 = [0;1];
                x2 = [0;0];
                centroCirculo = [0;1];
            else
                c = r;
                sL_h = a;
                sL_v = b;
                centroCirculo = x1;
            end
            rectanglePoints = [...
                x2(1) - sL_h, x1(1) - c, x2(2) - sL_v, x1(2) - c; ...
                x2(1) + sL_h, x1(1) + c, x2(2) + sL_v, x1(2) + c
            ];
            xmin = min(rectanglePoints(:, 1));
            xmax = max(rectanglePoints(:, 1));
            ymin = min(rectanglePoints(:, 2));
            ymax = max(rectanglePoints(:, 2));
            fig2d_args{1} = mean([xmin, ymin; xmax, ymax])';
            % Llamar super métodos en subclases de objetos (V.C.)
            obj = obj@Figura2D(fig2d_args{:}); % Poner la figura al objeto
            obj.radio  = c;
            obj.centroCirculo = centroCirculo;
            obj.semiLado_hor = sL_h;
            obj.semiLado_ver = sL_v;
            obj.xminR = x2(1) - sL_h;
            obj.xmaxR = x2(1) + sL_h;
            obj.yminR = x2(2) - sL_v;
            obj.ymaxR = x2(2) + sL_v;
            obj.xmin = xmin;
            obj.xmax = xmax;
            obj.ymin = ymin;
            obj.ymax = ymax;
        end
        function bln = contiene(obj, p)
            if nargin == 0
                pv = [0.0;0.0];  
            else
                pv = p;  
            end
            d = pv - obj.centroCirculo';
            bln = ((d' * d) <= obj.radio^2) & ...
                (pv(1) >= obj.xminR & ...
                pv(1) <= obj.xmaxR & ...
                pv(2) >= obj.yminR & ...
                pv(2) <= obj.ymaxR);
        end
        function xtam = valoresExtremos(obj)
            xtam = [[obj.xmin;obj.ymin],[obj.xmax;obj.ymax]];
        end
    end
end