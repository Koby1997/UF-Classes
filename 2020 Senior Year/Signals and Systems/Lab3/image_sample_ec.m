function [xs, ys, zs] = image_sample_ec(z, D)
    % IMAGE_SAMPLE samples grayscale or color image z every D pixels
    % in both the horizontal and vertical direction
    
    % creates matrix zs filled with 0's. dimensions(z-rows/D, z-col/D)
    zs = zeros(ceil(size(z, 1) / D), ceil(size(z, 2) / D), ceil(size(z, 3)));
    % creates 2 new arrays. One that is half of the size of z's rows.
    % And one that is half of the size of z's columns.
    % Both counting from 1 to their size
    ys = 1: ceil(size(z ,1) / D);
    xs = 1: ceil(size(z, 2) / D);
    % sets the zs rows and columns that are multiples of D equal to 
    % the z are multiples of Dx. The rest of zs is 0
    zs(1:end, 1:end, 1:end) = z(1:D:end, 1:D:end, 1:end);
end