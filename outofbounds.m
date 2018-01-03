function [pt1, pt2] = outofbounds(height, width, pt1, pt2)

    pt1(pt1 <= 0) = 1;
    pt2(pt2 <= 0) = 1;

    pt1_XindexOut = pt1(1,:) > width;
    pt1_YindexOut = pt1(2,:) > height;
    pt2_XindexOut = pt2(1,:) > width;
    pt2_YindexOut = pt2(2,:) > height;

    pt1(1, pt1_XindexOut) = width;
    pt1(2, pt1_YindexOut) = height;
    pt2(1, pt2_XindexOut) = width;
    pt2(1, pt2_YindexOut) = height;
   
end