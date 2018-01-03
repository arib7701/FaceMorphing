function triangulation = tridel(im1pts, im2pts)

% compute midway shape of two set of points
% to lessen the potential triangle deformations, 
% and avoid running into folding problems

% use delaunay for triangulation
% plot set of triangles 

meanpts = (im1pts + im2pts) / 2;
triangulation = delaunayTriangulation(meanpts);
