function averageFace = meanface()

% load img and txt pts
numimg = 5;
imglist = dir('images/students/*.jpg');
ptslist = dir('points/official/*.txt');

% 43 pts defined by images + 4 corners 
ptsnumber = 47;
img = cell(size(imglist, 1),1);
pts = zeros(numimg, ptsnumber, 2);

for i = 1:numimg
    currentimg = imread(strcat('images/students/', imglist(i).name));
    img{i} = im2double(currentimg);
    currenttxt = fopen(strcat('points/official/', ptslist(i).name));
    points = fscanf(currenttxt,'%f', [2 Inf]);
    points = points';
    % add 4 corners
    points = [points; [1,1]; [size(currentimg,2),1];[size(currentimg,2),size(currentimg,1)]; [1,size(currentimg,1)]];
    pts(i,:,:) = points;
end

% average all pts of n img
averagePts = zeros(1,ptsnumber,2);
for i = 1:numimg
    averagePts = averagePts + pts(i, :, :);
end
averagePts = averagePts/ numimg;
averagePts = reshape(averagePts,ptsnumber,2);

% triangulate average pts by delaunay
triangulation = delaunayTriangulation(averagePts);
fprintf("Triangulation of average points completed.\n");
%triplot(triangulation);

fprintf("Please wait for computation of average face.\n");

% morph each img into average shape using triangulation with warp_frac = 1,
% dissolve_frac = 0
averageWarp = zeros(numimg, size(img{1}, 1), size(img{1}, 2), 3);
for i = 1:numimg
    morphing = morphed_im(img{i}, img{i}, reshape(pts(i,:,:),ptsnumber,2), averagePts, triangulation, 1, 0);
    
    %imgname = strcat('warp_to_averagepts_', imglist(i).name);
    %imwrite(morphing, strcat('images/outputs/meanface/official/', imgname));
    
    averageWarp(i, :, :, :) = morphing;
end

% average each morphed img into one
averageFace = sum(averageWarp, 1);
averageFace = averageFace / numimg;
averageFace = reshape(averageFace, size(averageWarp, 2), size(averageWarp, 3),3);

%figure('Name','Mean Face of class'), hold off, imagesc(averageFace), axis image
%imgname = strcat('mean_face.jpg');
%imwrite(averageFace, strcat('images/outputs/meanface/official/', imgname));

