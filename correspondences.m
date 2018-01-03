function [im1pts, im2pts] = correspondences(im1, im2, im1name, im2name, mode)

im1namemat = strcat('points/mymat/', im1name, '.mat');
im2namemat = strcat('points/mymat/', im2name, '.mat');
im1nametxt = strcat('points/mytxt/', im1name, '.txt');
im2nametxt = strcat('points/mytxt/', im2name, '.txt');

% use my defined points
if (mode == true)
    if exist(im1namemat, 'file') && exist(im2namemat, 'file')
        im1pts = load(im1namemat);
        DataField1 = fieldnames(im1pts);
        im2pts = load(im2namemat);
        DataField2 = fieldnames(im2pts);
        [im1pts, im2pts] = cpselect(im1, im2, im1pts.(DataField1{1}), im2pts.(DataField2{1}), 'Wait', true);
    else
        [im1pts, im2pts] = cpselect(im1, im2, 'Wait', true);
        
        %add 4 corners of image
        im1pts = [im1pts; [1,1]; [size(im1,2),1];[size(im1,2),size(im1,1)]; [1,size(im1,1)]];
        im2pts = [im2pts; [1,1]; [size(im2,2),1];[size(im2,2),size(im2,1)]; [1,size(im2,1)]];
    end

    save(im1namemat, 'im1pts');
    save(im2namemat, 'im2pts');

% use official student's points
else
    im1nametxt = fopen(im1nametxt);
    im1Points = fscanf(im1nametxt,'%f', [2 Inf]);
    im1Points = im1Points';
    
    im2nametxt = fopen(im2nametxt);
    im2Points = fscanf(im2nametxt,'%f', [2 Inf]);
    im2Points = im2Points';
    
   [im1pts, im2pts] = cpselect(im1, im2, im1Points, im2Points, 'Wait', true);
   
   %add 4 corners of image
   im1pts = [im1pts; [1,1]; [size(im1,2),1];[size(im1,2),size(im1,1)]; [1,size(im1,1)]];
   im2pts = [im2pts; [1,1]; [size(im2,2),1];[size(im2,2),size(im2,1)]; [1,size(im2,1)]];
   
end


