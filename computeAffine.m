function AffineMatrix = computeAffine(triangle_pts1, triangle_pts2)

    % compute affine transfo matrix A
    % p' = Ap
    % p'p(-1) = App(-1)
    % p'p(-1) = AI
    % A = p'p(-1)
    
    %work in homogenous coordinates
    
    p = [triangle_pts1 ones(3,1)]';
    pprim = [triangle_pts2 ones(3,1)]';
    pminus = pinv(p);
    
    AffineMatrix = pprim*pminus;
    AffineMatrix(3,:,:) = [0 0 1];