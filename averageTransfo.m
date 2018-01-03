function averageTransfo(im1, im1name_average)

    % correspondence between im1 and averageMen
    averageFaceM = im2double(imread('images/averages/averageMen.jpg'));
    im1nameM = strcat(im1name_average, int2str(1));
    im2nameM = 'averageMen';
    [im1ptsM, avePtsM] = correspondences(im1, averageFaceM, im1nameM, im2nameM, true);
    
    % triangulation between im1 and averageMen
    triM = tridel(im1ptsM, avePtsM);
    %triplot(triM);
    fprintf("Triangulation with averageMen face completed.\n");

    % warp im1 into averageMen face
    morphing_to_averageMen = morphed_im(im1, im1, im1ptsM, avePtsM, triM, 1, 0);
    %figure('Name','My AverageMen Face'), hold off, imagesc(morphing_to_averageMen), axis image
    %imgnameM = strcat(im1nameM, '_to_', im2nameM, '.jpg');
    %imwrite(morphing_to_averageMen, strcat('images/outputs/averages/', imgnameM));
    
    
    
    
    % correspondence between im1 and averageWomen
    averageFaceW = im2double(imread('images/averages/averageWomen.jpg'));
    im1nameW = strcat(im1name_average, int2str(2));
    im2nameW = 'averageWomen';
    [im1ptsW, avePtsW] = correspondences(im1, averageFaceW, im1nameW, im2nameW, true);
    
    % triangulation between im1 and averageWomen
    triW = tridel(im1ptsW, avePtsW);
    %triplot(triW);
    fprintf("Triangulation with averageWomen face completed.\n");

    % warp im1 into averageWomen face
    morphing_to_averageWomen = morphed_im(im1, im1, im1ptsW, avePtsW, triW, 1, 0);
    %figure('Name','My AverageWomen Face'), hold off, imagesc(morphing_to_averageWomen), axis image
    %imgnameW = strcat(im1nameW, '_to_', im2nameW, '.jpg');
    %imwrite(morphing_to_averageWomen, strcat('images/outputs/averages/', imgnameW));
    
    
    
    % correspondence between im1 and averageBlack
    averageFaceB = im2double(imread('images/averages/averageBlack.jpg'));
    im1nameB = strcat(im1name_average, int2str(3));
    im2nameB = 'averageBlack';
    [im1ptsB, avePtsB] = correspondences(im1, averageFaceB, im1nameB, im2nameB, true);
    
    % triangulation between im1 and averageBlack
    triB = tridel(im1ptsB, avePtsB);
    %triplot(triB);
    fprintf("Triangulation with averageBlack face completed.\n");

    % warp im1 into averageBlack face
    morphing_to_averageBlack = morphed_im(im1, im1, im1ptsB, avePtsB, triB, 1, 0);
    %figure('Name','My AverageBlack Face'), hold off, imagesc(morphing_to_averageBlack), axis image
    %imgnameB = strcat(im1nameB, '_to_', im2nameB, '.jpg');
    %imwrite(morphing_to_averageBlack, strcat('images/outputs/averages/', imgnameB));