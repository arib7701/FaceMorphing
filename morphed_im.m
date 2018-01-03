function image_morphed = morphed_im(im1, im2, im1pts, im2pts, triangulation, warp_frac, dissolve_frac)

    % create intermediate shape
    intermediate_shape_pts = (1-warp_frac)*im1pts + warp_frac*im2pts;
    
    % warp both images toward intermediate shape pts
    im1warp = warp(im1, im1pts, intermediate_shape_pts, triangulation);
    im2warp = warp(im2, im2pts, intermediate_shape_pts, triangulation);
    
    % cross-dissolve 2 imgwarp into morphed image
    image_morphed = (1-dissolve_frac)*im1warp + dissolve_frac*im2warp;
    
    