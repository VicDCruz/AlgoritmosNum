function [areaOutput] = areaIntersection(r1, c1, r2, c2, k)
%Get the intersection area of 2 circles
%   By havind the radious & the centers of 2 circles, it is posible to get
%   the area, but first, the axes have to be rotated.
%% Get angle of rotation
if (c2(1) - c1(1)) ~= 0, m = (c2(2) - c1(2)) / (c2(1) - c1(1));
else, m = 2;
end
theta = m * pi / 4;
%% Transform the centers to the new axes
c1P = [cos(theta), sin(theta); -sin(theta), cos(theta)] * c1';
c2P = [cos(theta), sin(theta); -sin(theta), cos(theta)] * c2';
%% Get height & width of the intersection's rectangle (I)
x1I = c2P(1) - r2; x2I = c1P(1) + r1;
y1I = -sqrt(r1^2 - (((c1P(1) + r1) + (c2P(1) - r2)) / 2 - c1P(1))) + c1P(2);
y2I = sqrt(r1^2 - (((c1P(1) + r1) + (c2P(1) - r2)) / 2 - c1P(1))) + c1P(2);
w = x2I - x1I; h = y2I - y1I;
areaRectangle = abs(w * h);
%% Generate random points
a = x1I; b = x2I; x = (b-a).*rand(k,1) + a;
a = y1I; b = y2I; y = (b-a).*rand(k,1) + a;
%% Get intersection's area
areaOutput = sum((x - c1P(1)).^2 + (y - c1P(2)).^2 <= r1^2 & (x - c2P(1)).^2 + (y - c2P(2)).^2 <= r2^2) / k * areaRectangle;
end