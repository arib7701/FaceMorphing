function meanfaceTransfo (im1, averageFace, im1name)

    % correspondence between im1 and averageImg
    im2name = 'average';
    [im1pts, avePts] = correspondences(im1, averageFace, im1name, im2name, true);
    
    % triangulation between im1 and averageImg
    tri = tridel(im1pts, avePts);
    %triplot(tri);
    fprintf("Triangulation with mean face completed.\n");

    % warp im1 into mean face
    morphing_to_average = morphed_im(im1, im1, im1pts, avePts, tri, 1, 0);
    %figure('Name','My Mean Face'), hold off, imagesc(morphing_to_average), axis image
    %imgname = strcat(im1name, '_to_', im2name, '.jpg');
    %imwrite(morphing_to_average, strcat('images/outputs/meanface/', imgname));

    % warp mean face into im1
    morphing_to_me = morphed_im(averageFace,averageFace, avePts, im1pts, tri, 1, 0);
    %figure('Name','Mean Face to Me'), hold off, imagesc(morphing_to_me), axis image
    %imgname = strcat(im2name, '_to_', im1name, '.jpg');
    %imwrite(morphing_to_me, strcat('images/outputs/meanface/', imgname));
    
    % warp im1 into caricature using warp_frac = 2
    morphing_to_caricature = morphed_im(im1, im1, im1pts, avePts, tri, 2, 0);
    %figure('Name','Caricature Face'), hold off, imagesc(morphing_to_caricature), axis image
    %imgname = strcat(im1name, '_to_caricature.jpg');
    %imwrite(morphing_to_caricature, strcat('images/outputs/meanface/', imgname));
