close all; % closes all figures

% read images and convert to double format
im1 = im2double(imread('images/students/amandine.jpg'));
im1cropped = im2double(imread('images/averages/amandine.jpg'));
im2 = im2double(imread('images/students/branson.jpg'));
im1name = 'amandine';
im2name = 'branson';
im1name_average = 'amandine_average';

%set/get points of correspondence between the 2 imgs
select = true;
[im1pts, im2pts] = correspondences(im1, im2, im1name, im2name, select);

fprintf("Please wait for computation.\n");

%triangulate with delauney
triangulation = tridel(im1pts, im2pts);
fprintf("Triangulation completed.\n");
%triplot(triangulation);

morphing = morphed_im(im1, im2, im1pts, im2pts, triangulation, 0.5,0.5);
%imgname = strcat(im1name, '_to_', im2name, '_half_way.jpg');
%imwrite(morphing, strcat('images/outputs/morphed/officialpts/', imgname));

%movie = VideoWriter(strcat('videos/',im1name,'_',im2name,'.avi'));
fprintf("Video initialized.\n");

%morph images using z sequences
z = 61;
%open(movie);
count = 0;
for n = linspace(0,1,z)
    if n == 0
        morphing = im1;
        fprintf("Adding frame %d to video.\n", count);
    elseif n == 1
        morphing = im2;
        fprintf("Adding frame %d to video.\n", count);
    else
        morphing = morphed_im(im1, im2, im1pts, im2pts, triangulation, n,n);
        fprintf("Adding frame %d to video.\n", count);
        %imgname = strcat(im1name, '_to_', im2name, '_frame_', int2str(count),'.jpg');
        %imwrite(morphing, strcat('images/outputs/morphed/officialpts/', imgname));
    end
    count = count+1;
    %writeVideo(movie, morphing);
end
%close(movie);
fprintf("Check video folder for output video.\n");


fprintf("Please wait for computation of mean face of class students.\n");
meanFace = meanface();

fprintf("Please wait for computation for warping between mean face and the first image.\n");
meanfaceTransfo(im1, meanFace, im1name_average);

fprintf("Please wait for computation for warping between average faces and the first image.\n");
averageTransfo(im1cropped, im1name_average);

fprintf("Check images/output/meanface and images/output/averages folder for results images.\n");