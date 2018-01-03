function image_warped = warp(im, impts, intermediatepts, triangulation)

image_warped = im;
[rows, cols, rgb] = size(image_warped);
num_triangles = size(triangulation,1);
affineMatrices = zeros(3,3,num_triangles);

%create grid based on img size
[Y, X] = meshgrid(1:rows, 1:cols);

% find for each pt in intermediatepts to which triangle it belongs
triangleIndex = mytsearch(intermediatepts(:,1), intermediatepts(:,2), triangulation, X, Y);

%remove all index that are NaN (for pts in no triangles)
goodIndex = ~isnan(triangleIndex);
xcoord = X(goodIndex);
ycoord = Y(goodIndex);

%for each triangle
for i = 1:num_triangles
    
    %compute affine Matrix
    affineMatrices(:,:,i) = computeAffine(impts(triangulation(i,:),:), intermediatepts(triangulation(i, :),:));
    
    %find pts in triangle - work in homogenous coordinates
    ptsTriangle = find(triangleIndex(goodIndex) == i);
    pprim = [xcoord(ptsTriangle) ycoord(ptsTriangle) ones(size(ptsTriangle, 1), 1)]';
    
    % do inserve warp step1
    inverseAffineMatrix = pinv(affineMatrices(:,:,i));
    p = floor(inverseAffineMatrix*pprim);
    
    %correct pts that end out of bounds of the img
    [p, pprim] = outofbounds(rows, cols, p, pprim);
    
    %convert p and pprim to linear vector
    imgsize = [rows, cols];
    p_vector_index = sub2ind(imgsize, p(2, :), p(1, :));
    pprim_vector_index = sub2ind(imgsize, pprim(2, :), pprim(1, :));
        
    %inverse wrap for the 3 rgb channels step2
    image_warped(pprim_vector_index) = im(p_vector_index);
    if rgb == 3
        image_warped(pprim_vector_index + cols*rows) = im(p_vector_index + cols*rows);
        image_warped(pprim_vector_index + 2*cols*rows) = im(p_vector_index + 2*cols*rows);
    end
end

