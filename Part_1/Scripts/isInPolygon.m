% @file isInPolygon
% @brief this is the function to check the point whether inside the
% polygon obstacle
% @detail the polygon is not convex; first we connect point (120, 55) and (165, 89);
% and then, check whether point inside the polygon (120 ,55) (165 ,89) (188 ,51)
% (168, 14) and (145 ,14). Next, check the point whether inside triangular 
% (120, 55) (158, 51) and (165, 89)
% @param point This is the coordinate of 2D point on the map; e.g [2 3]
% means x = 2 and y = 3
% @return isInside Whether the point is inside the polygon 

function isIn = isInPolygon(point)
    % since the crossproduct in Matlab only available in 3D vector
    % we expand all 2D vector to 3D by adding 0 in z - direction
    
dimSize = size(point, 2);       % dimension of point
if dimSize ~= 2             % check whether the input is correct
    disp('The input point is not 2D !!');
    return;
end

% expand point from 2D to 3D
point = [point 0];      % input point

% set coordinate of vertrice of polygon
A = [145 14 0];
B = [120 55 0];
C = [165 89 0];
D = [158 51 0];
E = [188 51 0];
F = [168 14 0];

% set edge of convex polygon ABCEF in the form of vector
AB = B - A;
BC = C - B;
CE = E - C;
EF = F - E;
FA = A - F;

% set edge of triangle BCD in the form of vector
CD = D - C;
DB = B - D;


% check whether the point is inside the convex polygon
% check whether point is at the right of AB, BC, CE, EF, FA
crossPAB = cross(point - A, AB);
crossPBC = cross(point - B, BC);
crossPCE = cross(point - C, CE);
crossPEF = cross(point - E, EF);
crossPFA = cross(point - F, FA);

if crossPAB(3)>0 && crossPBC(3)>0 && crossPCE(3)>0 && crossPEF(3)>0 && crossPFA(3)>0
    isInConvexPolygon = true;
else
    isInConvexPolygon = false;
end

% check whether the point is insdie the triangle
% check whether point is at the right of BC, CD, DB 
% crossPBC can be obtain from previous computation
crossPCD = cross(point - C, CD);
crossPDB = cross(point - B, DB);

if crossPBC(3)>0 && crossPCD(3)>0 && crossPDB(3)>0 
    isInTriangle = true;
else
    isInTriangle = false;
end

if isInConvexPolygon && ~isInTriangle
    isIn = true;
else
    isIn = false;
end




end
